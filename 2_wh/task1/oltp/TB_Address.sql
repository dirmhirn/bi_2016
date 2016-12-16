-- Create Address table for task 1
CREATE TABLE IF NOT EXISTS `TB_Address` (
  `AddressID` INT NOT NULL,
  `AddressLine` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `StateProvince` VARCHAR(45),
  `PostalCode` VARCHAR(45) NOT NULL,
  `CountryRegion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;
