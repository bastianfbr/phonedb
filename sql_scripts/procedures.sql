DELIMITER //

CREATE PROCEDURE CreateDeviceSpecification(
  IN pBrand VARCHAR(30),
  IN pName VARCHAR(50),
  IN pAnnouncedDate DATE,
  IN pPrice DECIMAL(6,2),
  IN pStatus ENUM('AVAILABLE', 'COMING', 'RUMOR'),
  IN pHeight DECIMAL(4,1),
  IN pWidth DECIMAL(3,1),
  IN pWeight DECIMAL(4,1),
  IN pThickness DECIMAL(2,1),
  IN pBack ENUM('GLASS', 'PLASTIC', 'GLASSTIC', 'VEGAN LEATHER', 'OTHER'),
  IN pDisplayTech ENUM('OLED', 'LCD'),
  IN pDisplaySize DECIMAL(3,2),
  IN pRatio VARCHAR(5),
  IN pResolution VARCHAR(9),
  IN pCameraMain DECIMAL(5,2),
  IN pCameraNumber INT,
  IN pUltrawide BOOLEAN,
  IN pTelephoto BOOLEAN,
  IN pSelfie DECIMAL(4,2),
  IN pBatteryCapacity INT,
  IN pCharging INT,
  IN pWireless BOOLEAN,
  IN pReverse BOOLEAN,
  IN pRam INT,
  IN pRom INT,
  IN pExpandable BOOLEAN,
  IN pAndroidName VARCHAR(20),
  IN pUpdates INT,
  IN pSecurityUpdates INT,
  IN pSoCName VARCHAR(50),
  IN pNm INT,
  OUT pDeviceId INT
)
BEGIN
  DECLARE androidId, socId, memoryId INT;

  -- Check if Android exists, retrieve ID or create a new record
  SELECT id INTO androidId FROM Android WHERE name = pAndroidName;
  IF androidId IS NULL THEN
    INSERT INTO Android (name, updates, security_updates) VALUES (pAndroidName, pUpdates, pSecurityUpdates);
    SET androidId = LAST_INSERT_ID();
  END IF;

  -- Check if SystemOnChip exists, retrieve ID or create a new record
  SELECT id INTO socId FROM SystemOnChip WHERE name = pSoCName;
  IF socId IS NULL THEN
    INSERT INTO SystemOnChip (name, nm) VALUES (pSoCName, pNm);
    SET socId = LAST_INSERT_ID();
  END IF;

  -- Check if Memory exists, retrieve ID or create a new record
  SELECT id INTO memoryId FROM Memory WHERE ram = pRam AND rom = pRom AND expandable = pExpandable;
  IF memoryId IS NULL THEN
    INSERT INTO Memory (ram, rom, expandable) VALUES (pRam, pRom, pExpandable);
    SET memoryId = LAST_INSERT_ID();
  END IF;

  -- Insert the device specification
  INSERT INTO Device (brand, name, announced_date, price, status, height, width, weight, thickness, back, display_tech, display_size, ratio, resolution, camera_main, camera_number, ultrawide, telephoto, selfie, battery_capacity, charging, wireless, `reverse`, memory_id, soc_id, android_id)
  VALUES (pBrand, pName, pAnnouncedDate, pPrice, pStatus, pHeight, pWidth, pWeight, pThickness, pBack, pDisplayTech, pDisplaySize, pRatio, pResolution, pCameraMain, pCameraNumber, pUltrawide, pTelephoto, pSelfie, pBatteryCapacity, pCharging, pWireless, pReverse, memoryId, socId, androidId);

  SET pDeviceId = LAST_INSERT_ID();
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateUser(
  IN pUsername VARCHAR(20),
  IN pMail VARCHAR(100),
  IN pPassword VARCHAR(50),
  IN pRole ENUM('ADMIN', 'MOD', 'USER')
)
BEGIN
  INSERT INTO User (username, mail, password, role) VALUES (pUsername, pMail, pPassword, pRole);
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE CreateReview(
  IN pUsername VARCHAR(20),
  IN pDeviceName VARCHAR(50),
  IN pDesign INT,
  IN pDisplay INT,
  IN pPerformance INT,
  IN pCamera INT,
  IN pBattery INT,
  IN pSoftware INT,
  IN pFinal DECIMAL(2,1),
  IN pComment TEXT
)
BEGIN
  DECLARE userId, deviceId INT;

  -- Retrieve the User ID
  SELECT id INTO userId FROM User WHERE username = pUsername;

  -- Retrieve the Device ID
  SELECT id INTO deviceId FROM Device WHERE name = pDeviceName;

  -- Insert the review
  INSERT INTO Review (user_id, device_id, design, display, performance, camera, battery, software, final, comment)
  VALUES (userId, deviceId, pDesign, pDisplay, pPerformance, pCamera, pBattery, pSoftware, pFinal, pComment);
END //

DELIMITER ;