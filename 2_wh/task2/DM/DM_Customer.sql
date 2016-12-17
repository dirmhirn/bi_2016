-- -----------------------------------------------------
-- Table `DM_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DM_Customer` (
  `CustomerID` INT NOT NULL,
  `Name` VARCHAR(150) NOT NULL,
  `BirthDate` DATE NOT NULL,
  `Age` INT NULL,
  `Gender` VARCHAR(10) NOT NULL,
  `Email` VARCHAR(255) NULL,
  `Phone` VARCHAR(255) NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;
