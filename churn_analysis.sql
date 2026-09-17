USE saas_customer_churn;

-- 1. BASELINE CHURN OVERVIEW

SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    COUNT(*) - SUM(churn) AS active_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM customer_status;


-- 2. CREATE MASTER ANALYSIS VIEW

DROP VIEW IF EXISTS churn_analysis;

CREATE VIEW churn_analysis AS
SELECT
    c.customer_id,
    c.company_size,
    c.industry,
    c.country,
    c.signup_date,

    s.subscription_id,
    s.plan,
    s.contract_type,
    s.monthly_recurring_revenue,
    s.discount_percentage,
    s.contract_start_date,
    s.contract_end_date,

    u.monthly_logins,
    u.active_users,
    u.monthly_sessions,
    u.feature_adoption_rate,
    u.usage_change_pct,
    u.days_since_last_login,
    u.onboarding_completion,
    u.number_of_integrations,

    sd.support_tickets,
    sd.unresolved_tickets,
    sd.avg_resolution_hours,
    sd.satisfaction_score,
    sd.nps_score,

    cs.churn,
    cs.churn_date,
    cs.churn_reason

FROM customers c
JOIN subscriptions s
    ON c.customer_id = s.customer_id
JOIN usage_metrics u
    ON c.customer_id = u.customer_id
JOIN support_data sd
    ON c.customer_id = sd.customer_id
JOIN customer_status cs
    ON c.customer_id = cs.customer_id;


-- Verify view

SELECT COUNT(*) AS total_records
FROM churn_analysis;


-- 3. CHURN BY PLAN

SELECT
    plan,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY plan
ORDER BY churn_rate_pct DESC;


-- 4. CHURN BY CONTRACT TYPE

SELECT
    contract_type,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;


-- 5. CHURN BY COMPANY SIZE

SELECT
    company_size,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY company_size
ORDER BY churn_rate_pct DESC;


-- 6. CHURN BY INDUSTRY

SELECT
    industry,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY industry
ORDER BY churn_rate_pct DESC;


-- 7. USAGE METRICS: ACTIVE VS CHURNED

SELECT
    CASE
        WHEN churn = 1 THEN 'Churned'
        ELSE 'Active'
    END AS customer_status,
    ROUND(AVG(monthly_logins), 2) AS avg_monthly_logins,
    ROUND(AVG(active_users), 2) AS avg_active_users,
    ROUND(AVG(monthly_sessions), 2) AS avg_monthly_sessions,
    ROUND(AVG(feature_adoption_rate), 2) AS avg_feature_adoption_pct,
    ROUND(AVG(usage_change_pct), 2) AS avg_usage_change_pct,
    ROUND(AVG(days_since_last_login), 2) AS avg_days_since_last_login,
    ROUND(AVG(onboarding_completion), 2) AS avg_onboarding_completion_pct
FROM churn_analysis
GROUP BY churn
ORDER BY churn;


-- 8. SUPPORT METRICS: ACTIVE VS CHURNED

SELECT
    CASE
        WHEN churn = 1 THEN 'Churned'
        ELSE 'Active'
    END AS customer_status,
    ROUND(AVG(support_tickets), 2) AS avg_support_tickets,
    ROUND(AVG(unresolved_tickets), 2) AS avg_unresolved_tickets,
    ROUND(AVG(avg_resolution_hours), 2) AS avg_resolution_hours,
    ROUND(AVG(satisfaction_score), 2) AS avg_satisfaction_score,
    ROUND(AVG(nps_score), 2) AS avg_nps_score
FROM churn_analysis
GROUP BY churn
ORDER BY churn;


-- 9. MRR ASSOCIATED WITH CHURNED CUSTOMERS

SELECT
    ROUND(SUM(monthly_recurring_revenue), 2) AS total_mrr,
    ROUND(
        SUM(
            CASE
                WHEN churn = 1 THEN monthly_recurring_revenue
                ELSE 0
            END
        ),
        2
    ) AS churned_customer_mrr,
    ROUND(
        SUM(
            CASE
                WHEN churn = 1 THEN monthly_recurring_revenue
                ELSE 0
            END
        ) * 100.0 / SUM(monthly_recurring_revenue),
        2
    ) AS churned_mrr_pct
FROM churn_analysis;


-- 10. MRR BY PLAN

SELECT
    plan,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(monthly_recurring_revenue), 2) AS total_mrr,
    ROUND(
        SUM(
            CASE
                WHEN churn = 1 THEN monthly_recurring_revenue
                ELSE 0
            END
        ),
        2
    ) AS churned_mrr,
    ROUND(
        SUM(
            CASE
                WHEN churn = 1 THEN monthly_recurring_revenue
                ELSE 0
            END
        ) * 100.0 / SUM(monthly_recurring_revenue),
        2
    ) AS churned_mrr_pct
FROM churn_analysis
GROUP BY plan
ORDER BY churned_mrr DESC;


-- 11. CHURN REASONS

SELECT
    churn_reason,
    COUNT(*) AS churned_customers,
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(*)
            FROM churn_analysis
            WHERE churn = 1
        ),
        2
    ) AS churn_reason_pct,
    ROUND(SUM(monthly_recurring_revenue), 2) AS associated_mrr
FROM churn_analysis
WHERE churn = 1
GROUP BY churn_reason
ORDER BY churned_customers DESC;


-- 12. TOP CHURN REASONS

SELECT
    churn_reason,
    COUNT(*) AS churned_customers
FROM churn_analysis
WHERE churn = 1
GROUP BY churn_reason
ORDER BY churned_customers DESC
LIMIT 10;


-- 13. HIGH-RISK USAGE SIGNALS

SELECT
    CASE
        WHEN feature_adoption_rate < 50 THEN 'Low Feature Adoption'
        WHEN usage_change_pct < -10 THEN 'Declining Usage'
        WHEN days_since_last_login > 30 THEN 'Inactive Login'
        WHEN onboarding_completion < 60 THEN 'Incomplete Onboarding'
        ELSE 'Other'
    END AS risk_signal,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY risk_signal
ORDER BY churn_rate_pct DESC;


-- 14. SUPPORT RISK

SELECT
    CASE
        WHEN unresolved_tickets > 0
            THEN 'Has Unresolved Tickets'
        ELSE 'No Unresolved Tickets'
    END AS support_status,
    COUNT(*) AS customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) * 100.0 / COUNT(*), 2) AS churn_rate_pct
FROM churn_analysis
GROUP BY support_status
ORDER BY churn_rate_pct DESC;


-- 15. CUSTOMER-LEVEL RETENTION DATA

SELECT
    customer_id,
    company_size,
    industry,
    country,
    plan,
    contract_type,
    monthly_recurring_revenue,
    feature_adoption_rate,
    usage_change_pct,
    days_since_last_login,
    onboarding_completion,
    number_of_integrations,
    support_tickets,
    unresolved_tickets,
    satisfaction_score,
    nps_score,
    churn,
    churn_reason
FROM churn_analysis
ORDER BY customer_id;