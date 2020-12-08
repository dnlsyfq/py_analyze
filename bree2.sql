SELECT
       date_time,
       round(avg(nitrogen)) avg_n,
       round(avg(phosphorus)) avg_p,
       round(avg(potassium)) avg_k,
       round(avg(soil_ec)) avg_ec,
       round(avg(soil_salinity)) avg_salinity
FROM (SELECT DATE_FORMAT(updated_at,'%d-%b-%Y') date_time,
    device_unique_identifier device_id,
#     translated_value ->> '$.soilPh' soil_ph,
    translated_value ->> '$.nitrogen' nitrogen,
    translated_value ->> '$.phosphorus' phosphorus,
    translated_value ->> '$.potassium' potassium,
#     translated_value ->> '$.soilMoisture' soil_moisture,
#     translated_value ->> '$.soilTemperature' soil_temperature,
    translated_value ->> '$.soilEc' soil_ec,
    translated_value ->> '$.soilSalinity' soil_salinity
FROM device_raw_readings
# WHERE device_unique_identifier IN ('7EC1AA','7EC1BA','E7940A','E79404','7EC1AB');
WHERE device_unique_identifier = '7EC1AA') df
group by date_time

