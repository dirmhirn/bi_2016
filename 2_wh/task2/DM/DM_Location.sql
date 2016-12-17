-- -----------------------------------------------------
-- Table `DM_Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DM_Location` (
  `AddressID` INT NOT NULL,
  `PostalCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `StateProvince` VARCHAR(45) NULL,
  `CountryRegion` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;
