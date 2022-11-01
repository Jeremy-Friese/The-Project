CREATE TABLE dbo.oct_vitals
(
"date" DATE,
"weight" FLOAT(2),
"avg_weight" FLOAT(2),
"bmi" FLOAT(2),
"body_fat" FLOAT(2),
"muscle_mass"FLOAT(2),
"bone_mass" FLOAT(2),
"body_water" FLOAT(2),
"systolic" FLOAT(2),
"diastolic" FLOAT(2),
"heart_rate" FLOAT(2),
"oxygen" FLOAT(2),
"last_sleep" FLOAT(2),
);

INSERT INTO dbo.oct_vitals 
(date, weight, avg_weight, bmi, body_fat, muscle_mass, bone_mass, body_water, systolic, diastolic, heart_rate, oxygen, last_sleep)
VALUES
('2022-10-19', 171.5, 172.8, 25.4, 24.8, 68.0, 8.8, 54.9, 99, 70, 71, 99, 7),
('2022-10-20', 172.6, 172.6, 25.6, 25.1, 68.3, 8.9, 54.7, 115, 80, 78, 99, 6.25),
('2022-10-21', 172.8, 172.6, 25.6, 24.2, 68.3, 9, 55.3, 121, 84, 78, 97, 8),
('2022-10-22', 174.5, 173.6, 25.8, 24, 68.7, 9.2, 55.5, 124, 86, 66, 97, 7),
('2022-10-23', 173, 173, 25.6, 24.5, 68.3, 9, 55.1, 113, 76, 73, 97, 7),
('2022-10-24', 173.3, 173, 25.7, 24.5, 68.4, 9, 55.1, 111, 78, 75, 97, 7),
('2022-10-25', 174.6, 173.5, 25.9, 24.7, 68.7, 9.1, 55.0, 109, 77, 66, 97, 7.5),
('2022-10-26', 173.3, 173.6, 25.7, 24.7, 68.4, 9, 54.9, 109, 82, 73, 97, 6.75),
('2022-10-27', 172.4, 173.3, 25.5, 25.2, 68.2, 8.8, 54.6, 1115, 79, 77, 97, 5),
('2022-10-28', 173.3, 173.5, 25.7, 25.1, 68.4, 8.9, 54.7, 111, 79, 77, 97, 7),
('2022-10-29', 173.9, 173.4, 25.8, 24.6, 68.6, 9.0, 55.1, 112, 78, 73, 99, 6.5); 

CREATE TABLE dbo.oct_rides
(
"date" DATE,
"ride_type" varchar(15),
"route" varchar(15),
"time" varchar(10),
"distance" FLOAT(2),
"avg_speed" FLOAT(2),
"max_speed" FLOAT(2), 
"avg_cadence" FLOAT(2),
"max_cadence" FLOAT(2),
"avg_heart_rate" FLOAT(2),
"max_heart_rate" FLOAT(2),
"brpm_avg" FLOAT(2), 
"brpm_max" FLOAT(2), 
"elavation_gain" FLOAT(2),
"avg_power" FLOAT(2), 
"max_power" FLOAT(2), 
"ftp" FLOAT(2),
"total_work_kj" FLOAT(2), 
"load" FLOAT(2), 
"calories_burned" FLOAT(2),
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
('2022-10-23', 'TRAINER', 'MILANO', '0:30:21', 9.68, 19.1, 24.7, 100, 113, 163, 181, 0, 0, 75, 133, 274, 200, 243, 50, 242),
('2022-10-26', 'TRAINER', 'LOMBARDY2', '1:18:30', 23.1, 17.7, 29.3, 93, 138, 170, 181, 0, 0, 394, 114, 195, 200, 536, 90, 536), 
('2022-10-27', 'ROAD CYCLING', 'DJP', '1:59:25', 30.91, 15.5, 23.9, 87, 136, 162, 173, 37, 42, 617, 106, 120, 200, 786, 361, 958), 
('2022-10-29', 'TRAINER', 'MILANO', '0:29:12', 9.67, 19.9, 25.8, 101, 130, 168, 182, 38, 45, 75, 112, 278, 200, 191, 158, 257); 

CREATE TABLE dbo.oct_power_meter
(
"date" DATE,
"route" varchar(25),
"left_balance" FLOAT(2), 
"right_balance" FLOAT(2), 
"total_stress_score" FLOAT(2), 
"natural_power" FLOAT(2), 
"intensity_factor" FLOAT(3), 
"total_strokes" FLOAT(2), 
);

INSERT INTO dbo.oct_power_meter
(date, route, left_balance, right_balance, total_stress_score, natural_power, intensity_factor, total_strokes)
VALUES
('2022-10-22', 'ZUBE_STOKES', 60, 40, 84, 109, '0.546', 11691), 
('2022-10-23', 'MILANO', 65, 35, 13.5, 104, '0.519', 3036),
('2022-10-26', 'LOMBARDY2', 0, 0, 45.4, 118, '0.589', NULL),
('2022-10-27', 'DJP', 61, 39, 77, 122, 0.612, 9099), 
('2022-10-29', 'MiLANO', 65, 35, 15.6, 116, 0.579, 2851);

SELECT * FROM dbo.oct_power_meter

UPDATE dbo.oct_power_meter
SET left_balance = 'NULL'
--SET righht_balance = 'NULL'
WHERE route = 'LOMBARDY2'



