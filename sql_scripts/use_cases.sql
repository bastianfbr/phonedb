-- Juliette souhaite un smartphone à moins de 250 euros avec un écran OLED.

SELECT * FROM Device
WHERE price < 250 AND display_tech = 'OLED';

-- Alexandre cherche un smartphone à moins de 500 euros avec un bon zoom (telephoto). 

SELECT * FROM Device
WHERE price < 500 AND telephoto = TRUE;

-- José se connecte sur son compte avec son pseudo “JoelLeGolem” et son mot de passe “JESuisUnGol€m” pour mettre Samsung en marque préférée et envoie une note pour le Samsung Galaxy S22 Ultra avec un petit commentaire.

UPDATE User
SET device_id = ( SELECT id FROM Device WHERE name = 'Samsung Galaxy S22 Ultra')
WHERE username = 'JoelLeGolem' AND password = 'JESuisUnGol€m';

INSERT INTO Review (user_id, device_id, design, display, performance, camera, battery, software, final, comment)
VALUES (( SELECT id FROM User WHERE username = "JoelLeGolem"), ( SELECT id FROM Device WHERE name = 'Samsung Galaxy S22 Ultra'), <design_rating>, <display_rating>, <performance_rating>, <camera_rating>, <battery_rating>, <software_rating>, <final_rating>, 'Petit commentaire.');

-- Derya regarde les différences avec le Google Pixel 7 et le Pixel 7a.

SELECT * FROM Device
WHERE name LIKE 'Google Pixel 7%' OR name LIKE 'Google Pixel 7a%';
