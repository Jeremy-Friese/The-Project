DROP TABLE dbo.oct_rides


CREATE TABLE dbo.oct_rides
(
"date" DATE,
"ride_type" varchar(15),
"route" varchar(15),
"time" varchar(10),
"distance" int,
"avg_speed" int,
"max_speed" int, 
"avg_cadence" int,
"max_cadence" int,
"avg_heart_rate" int,
"max_heart_rate" int,
"brpm_avg" int, 
"brpm_max" int, 
"elavation_gain" int,
"avg_power" int, 
"max_power" int, 
"ftp" int,
"total_work_kj" int, 
"load" int, 
"calories_burned" int,
);

INSERT INTO dbo.oct_rides
(date, ride_type, route, time, distance, avg_speed, max_speed, avg_cadence, max_cadence, avg_heart_rate, max_heart_rate, brpm_avg, brpm_max, elavation_gain, avg_power, max_power, ftp, total_work_kj, load, calories_burned)
VALUES ('2022-10-01', 'ROAD_CYCLING', 'DJP', '2:15:31', 32.14, 14.2, 26.4, 0, 0, 147, 175, 0, 0, 620, 84, 0, 0, 0, 0, 1330),
('2022-10-09', 'ROAD_CYCLING', 'SUN_SKI', '1:52:20', 30.51, 16.3, 23.2, 0, 0, 158, 179, 0, 0, 354, 108, 0, 0, 0, 0, 1483), 
('2022-10-13', 'STATIONARY_BIKE', 'NA', '0:45:01', 13.5, 0, 0, 0, 0, 140, 163, 0, 0, 0, 0, 0, 0, 0, 0, 459),
('2022-10-15', 'ROAD_CYCLING', 'ZUBE_STOKES', '2:49:06', 42.99, 15.3, 24.4, 78, 107, 156, 175, 36, 46, 512, 88, 0, 0, 889, 0, 2096),
('2022-10-18', 'TRAINER', 'BARCELONA', '0:52:11', 13.06, 15, 20, 89, 104, 159, 171, 38, 44, 407, 103, 134, 0, 332, 31, 321),
('2022-10-19', 'TRAINER', 'AMSTERDAM', '1:16:38', 21.72, 17, 22.6, 95, 114, 164, 175, 0, 0, 157, 102, 218, 0, 472, 101, 471),
('2022-10-22', 'ROAD_CYCLING', 'ZUBE_STOKES', '2:41:32', 43.51, 16.2, 24.9, 80, 137, 155, 175, 36, 44, 577, 90, 529, 200, 913, 365, 1163),
('2022-10-23', 'TRAINER', 'MILANO', '0:30:21', 9.68, 19.1, 24.7, 100, 113, 163, 181, 0, 0, 75, 133, 274, 200, 243, 50, 242);




SELECT * 
FROM dbo.oct_rides

CREATE TABLE dbo.oct_power_meter
(
"date" DATE,
"route" varchar(25),
"left_balance" int, 
"right_balance" int, 
"total_stress_score" int, 
"natural_power" int, 
"intensity_factor" varchar(10), 
"total_strokes" int, 
);

INSERT INTO dbo.oct_power_meter
(date, route, left_balance, right_balance, total_stress_score, natural_power, intensity_factor, total_strokes)
VALUES
('2022-10-22', 'ZUBE_STOKES', 60, 40, 84, 109, '0.546', 11691), 
('2022-10-23', 'MILANO', 65, 35, 13.5, 104, '0.519', 3036);

SELECT * 
FROM dbo.oct_power_meter

CREATE TABLE dbo.oct_vitals
(
"date" DATE,
"weight" int,
"avg_weight" int,
"bmi" int,
"body_fat" int,
"muscle_mass" int,
"bone_mass" int,
"body_water" int,
"systolic" int,
"diastolic" int,
"heart_rate" int,
"oxygen" int,
"last_sleep" int,
);

Select * 
From oct_vitals

SELECT rides.date
,rides.route
,ride_type
,distance
,avg_speed
,weight
,bmi
,last_sleep
,left_balance as LB
,right_balance as RB
,total_strokes
FROM dbo.oct_rides as rides
INNER JOIN dbo.oct_vitals as vitals
ON 
(rides.date = vitals.date
)
INNER JOIN dbo.oct_power_meter as meter
ON (vitals.date = meter.date)
WHERE vitals.date > '2022-10-13' AND last_sleep > 6
ORDER BY date


SELECT rides.date
,rides.route
,ride_type
,distance
,avg_speed
,weight
,bmi
,last_sleep
,left_balance as LB
,right_balance as RB
,total_strokes
FROM dbo.oct_rides as rides
INNER JOIN dbo.oct_vitals as vitals
ON 
(
rides.date = vitals.date
)
INNER JOIN dbo.oct_power_meter as meter
ON 
(
vitals.date = meter.date
)
WHERE vitals.date > '2022-10-13' AND last_sleep > 6
ORDER BY date