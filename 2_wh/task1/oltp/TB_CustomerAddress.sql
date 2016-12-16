-- Create table to join Customer and Address for task 1
CREATE TABLE IF NOT EXISTS `TB_CustomerAddress` (
  `CustomerID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `AddressType` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`CustomerID`, `AddressID`),
  INDEX `FK_Address_idx` (`AddressID` ASC),
  CONSTRAINT `FK_Address`
    FOREIGN KEY (`AddressID`)
    REFERENCES `TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
