-- Join all three datasets: car_stock, weather, and traffic_accidents
-- Filtered to date range 201901 - 202510 (accidents date range)
-- Excludes id, created_at, updated_at columns

SELECT 
    -- Car Stock columns
    cs.prefecture,
    cs.year_month,
    cs.kei_passenger,
    cs.kei_cargo,
    cs.kei_total,
    cs.registered_vehicles,
    cs.all_vehicles,
    
    -- Weather columns
    w.precip_total_mm,
    w.precip_max_daily_mm,
    w.temp_avg_c,
    w.temp_max_c,
    w.temp_min_c,
    w.wind_speed_avg_ms,
    w.wind_speed_max_ms,
    w.snowfall_total_cm,
    w.snow_depth_max_cm,
    w.snow_days,
    w.fog_days,
    
    -- Accidents columns
    a.accidents,
    a.deaths,
    a.injuries

FROM car_stock_monthly_prefecture_estimated cs

LEFT JOIN weather_data_prefecture w
    ON cs.prefecture = w.prefecture 
    AND cs.year_month = w.year_month

LEFT JOIN traffic_accidents a
    ON cs.prefecture = a.prefecture 
    AND cs.year_month = a.year_month

WHERE cs.year_month >= 201901 
  AND cs.year_month <= 202510

ORDER BY cs.prefecture, cs.year_month;
