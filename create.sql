DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Role;
DROP TABLE IF EXISTS Device;

CREATE TABLE Device(
  id INT NOT NULL AUTO_INCREMENT,
  brand VARCHAR(30) NOT NULL,
  name VARCHAR(50) NOT NULL,
  announced_date DATE,
  price DECIMAL(8,2),
  status ENUM("AVAILABLE", "COMING", "RUMOR") NOT NULL,
  height DECIMAL(4,1) NOT NULL,
  width DECIMAL(3,1) NOT NULL,
  weight DECIMAL(4,1) NOT NULL,
  thickness DECIMAL(2,1) NOT NULL,
  back ENUM("GLASS", "PLASTIC", "GLASSTIC", "VEGAN LEATHER", "OTHER") NOT NULL,
  display_technology ENUM("OLED", "LCD") NOT NULL,
  display_size DECIMAL(3,2) NOT NULL,
  ratio VARCHAR(5) NOT NULL,
  resolution VARCHAR(9) NOT NULL,
  ram INT NOT NULL,
  rom INT NOT NULL,
  expandable BOOLEAN NOT NULL,
  soc_name VARCHAR(50) NOT NULL,
  soc_nm INT NOT NULL,
  camera_main DECIMAL(4,2) NOT NULL,
  camera_number INT NOT NULL,
  ultrawide BOOLEAN NOT NULL,
  telephoto BOOLEAN NOT NULL,
  selfie DECIMAL(4,2) NOT NULL,
  battery_capacity INT NOT NULL,
  charging INT NOT NULL,
  wireless BOOLEAN NOT NULL,
  reverse BOOLEAN NOT NULL,
  android INT NOT NULL,
  android_updates INT NOT NULL,
  security_updates INT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Role
  (id INT NOT NULL, name VARCHAR(20) NOT NULL, PRIMARY KEY(id));

CREATE TABLE User(
  id INT NOT NULL AUTO_INCREMENT,
  role_id INT NOT NULL,
  device_id INT NOT NULL,
  username VARCHAR(20) NOT NULL,
  mail VARCHAR(100) NOT NULL,
  password VARCHAR(50) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Review(
  id INT NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL,
  device_id INT NOT NULL,
  design INT NOT NULL,
  display INT NOT NULL,
  performance INT NOT NULL,
  camera INT NOT NULL,
  battery INT NOT NULL,
  software INT NOT NULL,
  final DECIMAL(1,1) NOT NULL,
  comment TEXT,
  PRIMARY KEY(id)
);

ALTER TABLE User
  ADD CONSTRAINT Role_Utilisateur FOREIGN KEY (role_id) REFERENCES Role (id);

ALTER TABLE Review
  ADD CONSTRAINT Devices_Review FOREIGN KEY (device_id) REFERENCES Device (id);

ALTER TABLE Review
  ADD CONSTRAINT Utilisateur_Review FOREIGN KEY (user_id) REFERENCES User (id);

ALTER TABLE User
  ADD CONSTRAINT Device_User FOREIGN KEY (device_id) REFERENCES Device (id);
