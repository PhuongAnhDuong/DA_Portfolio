# Compares the Daily Active Users (DAU) of all apps across two selected time periods, calculating the percentage change in user engagement

SELECT
    current_period.app,
    current_period.avg_dau AS 'After',
    previous_period.avg_dau AS 'Before',
    (current_period.avg_dau * 100 / previous_period.avg_dau - 100) AS 'Change (%)'
FROM
    (SELECT
        app,
        AVG(`app_overview_by_day`.`DAU`) AS avg_dau
    FROM
        `app_overview_by_day`
    WHERE
        {{date1}}
    GROUP BY
        app) AS current_period
LEFT JOIN
    (SELECT
        app AS app2,
        AVG(`app_overview_by_day`.`DAU`) AS avg_dau
    FROM
        `app_overview_by_day`
    WHERE
        {{date2}}
    GROUP BY
        app) AS previous_period
ON
    current_period.app = previous_period.app2;

# Retrieves daily user metrics, including new users, users who muted notifications, the unmute rate, and Daily Active Users (DAU) for specified apps and dates.

SELECT
      daily_metrics.date,
      daily_metrics.new_users AS 'New Users',
      daily_metrics.new_user_mute AS 'Muted Users',
      daily_metrics.rate_unmute,
      daily_metrics.dau AS 'Daily Active Users'
FROM
      (SELECT
            app,
            date,
            new_users,
            new_user_mute,
            new_user_mute / new_users AS rate_unmute,
            dau
      FROM
            app_overview_by_day
      WHERE
            {{app}} AND {{date}}) AS daily_metrics
LEFT JOIN
      (SELECT DISTINCT
            dau,
            app,
            date
      FROM
            app_overview_by_day) AS distinct_dau
ON 
      daily_metrics.app = distinct_dau.app AND daily_metrics.date = distinct_dau.date;

# Calculates the average Monthly Active Users (MAU)

SELECT 
      AVG(monthly_active_users) AS MAU
FROM 
      (SELECT 
            MAX(`app_overview_by_day`.`mau`) AS monthly_active_users
      FROM 
            `app_overview_by_day`
      WHERE 
            {{app}} AND {{date1}}
      GROUP BY 
            MONTH(date)
      ) AS monthly_data;

# Calculates the average tool page views for two periods

SELECT 
    pageview_data.app, 
    pageview_data.avg_after AS 'Pageview After', 
    previous_pageview_data.avg_before AS 'Pageview Before', 
    (pageview_data.avg_after * 100 / previous_pageview_data.avg_before) - 100 AS 'Change (%)'
FROM 
    (SELECT 
         app, 
         AVG(total_pageviews) AS avg_after 
     FROM 
         (SELECT 
              app, 
              MONTH(date) AS month, 
              SUM(`app_overview_by_day`.`pageview`) AS total_pageviews
          FROM 
              `app_overview_by_day`
          WHERE 
              {{date1}} 
          GROUP BY 
              app, 
              month(date)) AS after_subquery
     GROUP BY 
         app) AS pageview_data
LEFT JOIN 
    (SELECT 
         app AS app_before, 
         AVG(total_pageviews) AS avg_before 
     FROM 
         (SELECT 
              app, 
              MONTH(date) AS month, 
              SUM(`app_overview_by_day`.`tool_pageview`) AS total_pageviews
          FROM 
              `app_overview_by_day`
          WHERE 
              {{date2}} 
          GROUP BY 
              app, 
              month(date)) AS before_subquery 
     GROUP BY 
         app) AS previous_pageview_data
ON 
    pageview_data.app = previous_pageview_data.app_before;

# Retrieves data on weekly active users and loyal users.

SELECT
      CONCAT(week_number, '/', year) AS week,
      wau AS 'Weekly Active Users',
      user_trungthanh AS 'Loyal Users'
FROM
      kenh14_app_overview_by_week
WHERE
      {{app}} AND {{week}} AND {{year}}
ORDER BY
      year DESC,
      week_number DESC
LIMIT 4;

# Calculates the total clicks of the app

SELECT
      SUM(`app_overview_by_hour`.`total_click`) AS 'Total Clicks'
FROM
      `app_overview_by_hour`
WHERE
      {{app}} AND {{date1}};
