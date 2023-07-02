-- Juliette souhaite un smartphone à moins de 250 euros avec un écran OLED.

SELECT * FROM Device
WHERE price < 250 AND display_tech = 'OLED';

-- Alexandre cherche un smartphone à moins de 500 euros avec un bon zoom (telephoto). Il consulte les avis des utilisateurs.

SELECT d.*, r.* FROM Device d
INNER JOIN Review r ON d.id = r.device_id
WHERE d.price < 500 AND d.telephoto = 1;

-- José se connecte sur son compte avec son pseudo “JoelLeGolem” et son mot de passe “JESuisUnGol€m” pour mettre Samsung en marque préférée et envoie une note pour le Samsung Galaxy S22 Ultra avec un petit commentaire.

UPDATE User
SET device_id = <device_id_of_Samsung_Galaxy_S22_Ultra>
WHERE username = 'JoelLeGolem' AND password = 'JESuisUnGol€m';

INSERT INTO Review (id, user_id, device_id, design, display, performance, camera, battery, software, final, comment)
VALUES (<next_review_id>, <user_id_of_Joé>, <device_id_of_Samsung_Galaxy_S22_Ultra>, <design_rating>, <display_rating>, <performance_rating>, <camera_rating>, <battery_rating>, <software_rating>, <final_rating>, 'Petit commentaire.');

-- Derya regarde les différences avec le Pixel 7 et le Pixel 7a.

SELECT * FROM Device
WHERE name LIKE 'Pixel 7%' OR name LIKE 'Pixel 7a%';
