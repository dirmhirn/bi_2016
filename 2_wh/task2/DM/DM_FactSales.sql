CREATE TABLE IF NOT EXISTS `DM_FactSales` (
  `SalesOrderNumber` VARCHAR(16) NOT NULL,
  `SalesOrderLineNumber` VARCHAR(100) NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipmentMethod` VARCHAR(45) NOT NULL,
  `UnitPrice` DECIMAL(10,4) NULL,
  `Discount` DECIMAL(10,4) NULL,
  `OrderQuantity` INT NULL,
  `OrderLineTotal` DECIMAL(10,4) NULL,
  `OrderLineProfit` DECIMAL(10,4) NULL,
  `TaxAmount` DECIMAL(10,4) NULL,
  `OrderLineFreightCost` DECIMAL(10,4) NULL,
  `OrderStatus` INT NULL,
  `OrderDate` INT NOT NULL,
  `DueDate` INT NOT NULL,
  `ShipDate` INT NULL,
  `IsLateShipment` INT NULL,
  PRIMARY KEY (`SalesOrderNumber`, `SalesOrderLineNumber`),
  INDEX `FK_Customer_idx` (`CustomerID` ASC),
  INDEX `FK_Product_idx` (`ProductID` ASC),
  INDEX `FK_ShipToAddress_idx` (`ShipToAddressID` ASC),
  INDEX `FK_BillToAddress_idx` (`BillToAddressID` ASC),
  INDEX `FK_OrderDate_idx` (`OrderDate` ASC),
  INDEX `FK_DueDate_idx` (`DueDate` ASC),
  INDEX `FK_ShipDate_idx` (`ShipDate` ASC),
  CONSTRAINT `FK_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `DM_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product`
    FOREIGN KEY (`ProductID`)
    REFERENCES `DM_Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipToAddress`
    FOREIGN KEY (`ShipToAddressID`)
    REFERENCES `DM_Location` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BillToAddress`
    FOREIGN KEY (`BillToAddressID`)
    REFERENCES `DM_Location` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderDate`
    FOREIGN KEY (`OrderDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DueDate`
    FOREIGN KEY (`DueDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipDate`
    FOREIGN KEY (`ShipDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
