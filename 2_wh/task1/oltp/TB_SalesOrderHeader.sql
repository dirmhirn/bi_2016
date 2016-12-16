-- Create table with Sales Order Header data for task 1
CREATE TABLE IF NOT EXISTS `TB_SalesOrderHeader` (
  `SalesOrderID` INT NOT NULL,
  `RevisionNumber` INT(11) NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DueDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ShipDate` TIMESTAMP NULL,
  `Status` INT(11) NOT NULL,
  `SalesOrderNumber` VARCHAR(16) NOT NULL,
  `CustomerID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipMethodID` INT NOT NULL,
  PRIMARY KEY (`SalesOrderID`),
  INDEX `FK_Customer_idx` (`CustomerID` ASC),
  INDEX `FK_ShipToAddress_idx` (`ShipToAddressID` ASC),
  INDEX `FK_BillToAddress_idx` (`BillToAddressID` ASC),
  INDEX `FK_ShipMethod_idx` (`ShipMethodID` ASC),
  CONSTRAINT `FK_Customer2`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipToAddress`
    FOREIGN KEY (`ShipToAddressID`)
    REFERENCES `TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BillToAddress`
    FOREIGN KEY (`BillToAddressID`)
    REFERENCES `TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipMethod`
    FOREIGN KEY (`ShipMethodID`)
    REFERENCES `TB_ShipMethod` (`ShipMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
