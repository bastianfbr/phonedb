-- Juliette souhaite un smartphone à moins de 250 euros avec un écran OLED.

SELECT * FROM Device
WHERE price < 250 AND display_tech = 'OLED';

-- Alexandre cherche un smartphone à moins de 500 euros avec un bon zoom (telephoto). 

SELECT * FROM Device
WHERE price < 500 AND telephoto = TRUE;

-- José se crée un compte avec le pseudo "JoséLeGolem", se connecte et met le Samsung Galaxy S22 Ultra en smartphone puis envoie une note avec un petit commentaire.

INSERT INTO User (username, mail, password, role)
VALUES ('JoséLeGolem', 'golemiquejoel@gmail.com' , 'JESuisUnGol€m', 'USER');

UPDATE User
SET device_id = ( SELECT id FROM Device WHERE name = 'Samsung Galaxy S22 Ultra')
WHERE username = 'JoséLeGolem';

INSERT INTO Review (user_id, device_id, design, display, performance, camera, battery, software, final, comment)
VALUES (( SELECT id FROM User WHERE username = "JoséLeGolem"), ( SELECT id FROM Device WHERE name = 'Samsung Galaxy S22 Ultra'), 5, 5, 5, 5, 4, 5, 4.8, 'Petit commentaire.');

-- Derya regarde les différences avec le Google Pixel 7 et le Pixel 7a.

SELECT * FROM Device
WHERE name LIKE 'Google Pixel 7%' OR name LIKE 'Google Pixel 7a%';

-- François regarde la liste des smartphones avec la fiche technique complète.

SELECT d.name, d.price, d.status, d.display_size, d.camera_main AS 'Main Sensor', d.battery_capacity AS 'Battery', d.charging, d.wireless, d.reverse, m.ram, m.rom, m.expandable, s.name AS 'SoC', s.nm, a.name AS 'Android Version', a.updates, a.security_updates
FROM Device AS d
JOIN Memory AS m ON d.memory_id = m.id
JOIN SystemOnChip AS s ON d.soc_id = s.id
JOIN Android AS a ON d.android_id = a.id;