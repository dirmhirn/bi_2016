-- Create Customer Table for Task 1
CREATE TABLE IF NOT EXISTS `TB_Customer` (
  `CustomerID` INT NOT NULL,
  `Title` VARCHAR(16),
  `FirstName` VARCHAR(32) NOT NULL,
  `MiddleName` VARCHAR(32),
  `LastName` VARCHAR(32) NOT NULL,
  `Suffix` VARCHAR(16),
  `EmailAddress` VARCHAR(255) NULL,
  `Phone` VARCHAR(255) NULL,
  `Gender` VARCHAR(2) NOT NULL,
  `Birthdate` DATE NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;
