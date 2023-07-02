/* **************************************************************
*  Insertion des données dans les tables de la base de données  *
**************************************************************  */

-- Insertion des données dans la table Android

/* Google Pixel 7 3+5 */
INSERT INTO Android (id, name, updates, security_updates) VALUES (1, 'Android 13', 3, 5);
/* Asus Zenfone 10  2++4 */
INSERT INTO Android (id, name, updates, security_updates) VALUES (2, 'Android 13', 2, 4);
/* Sony Xperia 10 V 2+3 */
INSERT INTO Android (id, name, updates, security_updates) VALUES (3, 'Android 13', 2, 3);

-- Insertion des données dans la table SystemOnChip
INSERT INTO SystemOnChip (id, name, nm) VALUES (1, 'Google Tensor G2', 5);
INSERT INTO SystemOnChip (id, name, nm) VALUES (2, 'Qualcomm Snapdragon 8 Gen 2', 4);
INSERT INTO SystemOnChip (id, name, nm) VALUES (3, 'Qualcomm Snapdragon 8+ Gen 1', 4);
INSERT INTO SystemOnChip (id, name, nm) VALUES (4, 'Qualcomm Snapdragon 695 5G', 6);

-- Insertion des données dans la table Memory

INSERT INTO Memory (id, ram, rom, expandable) VALUES (1, 8, 128, FALSE);

-- Insertion de bastianfbr dans la table User

INSERT INTO User (id, username, mail, password, role) VALUES (1, 'bastianfbr', 'bastian@fbr.fr', '1234', 'ADMIN');

-- Chargement du fichier CSV dans la table Device

LOAD DATA LOCAL INFILE '../files/device.csv'
INTO TABLE Device
FIELDS TERMINATED BY ';'
IGNORE 1 LINES
(@id, @brand, @name, @announced_date, @price, @status, @height, @width, 
@weight, @thickness, @back, @display_tech, @display_size, @ratio, @resolution, 
@camera_main, @camera_number, @ultrawide, @telephoto, @selfie, @battery_capacity, 
@charging, @wireless, @reverse, @memory_id, @soc_id, @android_id)
SET id = @id, brand = @brand, name = @name, announced_date = STR_TO_DATE(@announced_date, '%d/%m/%Y'), 
price = @price, status = @status, height = @height, width = @width, weight = @weight, 
thickness = @thickness, back = @back, display_tech = @display_tech, display_size = @display_size, 
ratio = @ratio, resolution = @resolution, camera_main = @camera_main, camera_number = @camera_number, 
ultrawide = IF(UPPER(@ultrawide) = 'TRUE', TRUE, FALSE), telephoto = IF(UPPER(@telephoto) = 'TRUE', TRUE, FALSE), 
selfie = @selfie, battery_capacity = @battery_capacity, charging = @charging, 
wireless = IF(UPPER(@wireless) = 'TRUE', TRUE, FALSE), reverse = IF(UPPER(@reverse) = 'TRUE', TRUE, FALSE), 
memory_id = @memory_id, soc_id = @soc_id, android_id = @android_id; 