
-- -----------------------------------------------------
-- Schema BI_OLTP_36
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BI_OLTP_36` DEFAULT CHARACTER SET utf8 ;
USE `BI_OLTP_36` ;

-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_Customer` (
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


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_Address` (
  `AddressID` INT NOT NULL,
  `AddressLine` VARCHAR(255) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `StateProvince` VARCHAR(45),
  `PostalCode` VARCHAR(45) NOT NULL,
  `CountryRegion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_CustomerAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_CustomerAddress` (
  `CustomerID` INT NOT NULL,
  `AddressID` INT NOT NULL,
  `AddressType` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`CustomerID`, `AddressID`),
  INDEX `FK_Address_idx` (`AddressID` ASC),
  CONSTRAINT `FK_Address`
    FOREIGN KEY (`AddressID`)
    REFERENCES `BI_OLTP_36`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Customer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `BI_OLTP_36`.`TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_ShipMethod`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_ShipMethod` (
  `ShipMethodID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `CostPerShipment` DECIMAL(10,0) NOT NULL,
  `CostPerUnit` DECIMAL(10,0) NOT NULL,
  `BulkyItemSurcharge` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`ShipMethodID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_SalesOrderHeader`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_SalesOrderHeader` (
  `SalesOrderID` INT NOT NULL,
  `RevisionNumber` INT(11) NOT NULL,
  `OrderDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `DueDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ShipDate` TIMESTAMP,
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
    REFERENCES `BI_OLTP_36`.`TB_Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipToAddress`
    FOREIGN KEY (`ShipToAddressID`)
    REFERENCES `BI_OLTP_36`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BillToAddress`
    FOREIGN KEY (`BillToAddressID`)
    REFERENCES `BI_OLTP_36`.`TB_Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_ShipMethod`
    FOREIGN KEY (`ShipMethodID`)
    REFERENCES `BI_OLTP_36`.`TB_ShipMethod` (`ShipMethodID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_ProductCategory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_ProductCategory` (
  `ProductCategoryID` INT NOT NULL,
  `ParentProductCategoryID` INT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductCategoryID`),
  INDEX `FK_ParentProductCategory_idx` (`ParentProductCategoryID` ASC),
  CONSTRAINT `FK_ParentProductCategory`
    FOREIGN KEY (`ParentProductCategoryID`)
    REFERENCES `BI_OLTP_36`.`TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_Product` (
  `ProductID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ProductNumber` VARCHAR(16) NOT NULL,
  `StandardCost` DECIMAL(10,0) NOT NULL,
  `ListPrice` DECIMAL(10,0) NOT NULL,
  `Size` VARCHAR(16),
  `Weight` DECIMAL(10,0),
  `ProductCategoryID` INT NOT NULL,
  `ProductModelName` VARCHAR(45) NULL,
  `SellStartDate` TIMESTAMP NOT NULL,
  `SellEndDate` TIMESTAMP NULL,
  `DiscontinuedDate` TIMESTAMP NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `FK_ProductCategory_idx` (`ProductCategoryID` ASC),
  CONSTRAINT `FK_ProductCategory`
    FOREIGN KEY (`ProductCategoryID`)
    REFERENCES `BI_OLTP_36`.`TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BI_OLTP_36`.`TB_SalesOrderDetail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BI_OLTP_36`.`TB_SalesOrderDetail` (
  `SalesOrderID` INT NOT NULL,
  `SalesOrderDetailID` INT NOT NULL,
  `OrderQty` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `UnitPrice` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`SalesOrderID`, `SalesOrderDetailID`),
  INDEX `FK_Product_idx` (`ProductID` ASC),
  CONSTRAINT `FK_SalesOrder`
    FOREIGN KEY (`SalesOrderID`)
    REFERENCES `BI_OLTP_36`.`TB_SalesOrderHeader` (`SalesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product`
    FOREIGN KEY (`ProductID`)
    REFERENCES `BI_OLTP_36`.`TB_Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

