/* **************************************************************
*  Insertion des données dans les tables de la base de données  *
**************************************************************  */

-- Insertion des données dans la table Role

INSERT INTO Role VALUES (1, 'ADMIN');
INSERT INTO Role VALUES (2, 'MODERATOR');
INSERT INTO Role VALUES (3, 'USER');

/* DEVICE *
brand, name, announced_date, price, status, height, width, weight, thickness, back,
display_technology, display_size, ratio, resolution, ram, rom, expandable, 
soc_name, soc_nm, camera_main, camera_number, ultrawide, telephoto, selfie,
battery_capacity, charging, wireless, reverse, android, android_updates, security_updates
*/

-- Insertion du Google Pixel 7 dans la table Device
INSERT INTO Device (brand, name, announced_date, price, status, height, width, weight, thickness, back,
display_technology, display_size, ratio, resolution, ram, rom, expandable, 
soc_name, soc_nm, camera_main, camera_number, ultrawide, telephoto, selfie,
battery_capacity, charging, wireless, reverse, android, android_updates, security_updates)
VALUES ('Google', 'Pixel 7', '2022-10-06', 649, 'AVAILABLE', 155.6, 73.2, 197, 8.7, 'GLASS',
'OLED', 6.3, '20:9', '1080x2400', 8, 128, FALSE,
'Google Tensor G2', 5, 50, 2, TRUE, FALSE, 10.8,
4355, 20, TRUE, TRUE, 13, 3, 5);