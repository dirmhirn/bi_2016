-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema BI_OLAP_36
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BI_OLAP_36` ;

-- -----------------------------------------------------
-- Schema BI_OLAP_36
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BI_OLAP_36` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;
USE `BI_OLAP_36` ;

-- -----------------------------------------------------
-- Table `DM_Time`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DM_Time` ;

CREATE TABLE IF NOT EXISTS `DM_Time` (
  `DateID` INT NOT NULL,
  `DayNumberOfMonth` INT NOT NULL,
  `MonthNumberOfYear` INT NOT NULL,
  `CalendarYear` INT NOT NULL,
  PRIMARY KEY (`DateID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DM_Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DM_Customer` ;

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


-- -----------------------------------------------------
-- Table `DM_Product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DM_Product` ;

CREATE TABLE IF NOT EXISTS `DM_Product` (
  `ProductID` INT NOT NULL,
  `ProductNumber` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ModelName` VARCHAR(45) NULL,
  `StandardCost` DECIMAL(10,4) NOT NULL,
  `ListPrice` DECIMAL(10,4) NOT NULL,
  `ProductSubCategory` VARCHAR(45) NULL,
  `ProductTopCategory` VARCHAR(45) NULL,
  `SellStartDate` INT NOT NULL,
  `SellEndDate` INT NULL,
  `DiscontinuedDate` INT NULL,
  `Size` VARCHAR(16) NULL,
  `Weight` DECIMAL(10,4) NULL,
  `IsBulkyItem` INT NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `FK_SellStartDate_idx` (`SellStartDate` ASC),
  INDEX `FK_SellEndDate_idx` (`SellEndDate` ASC),
  INDEX `FK_DiscontinuedDate_idx` (`DiscontinuedDate` ASC),
  CONSTRAINT `FK_SellStartDate`
    FOREIGN KEY (`SellStartDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SellEndDate`
    FOREIGN KEY (`SellEndDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_DiscontinuedDate`
    FOREIGN KEY (`DiscontinuedDate`)
    REFERENCES `DM_Time` (`DateID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DM_Location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DM_Location` ;

CREATE TABLE IF NOT EXISTS `DM_Location` (
  `AddressID` INT NOT NULL,
  `PostalCode` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `StateProvince` VARCHAR(45) NULL,
  `CountryRegion` VARCHAR(45) NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DM_FactSales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DM_FactSales` ;

CREATE TABLE IF NOT EXISTS `DM_FactSales` (
  `SalesOrderNumber` INT NOT NULL,
  `SalesOrderLineNumber` VARCHAR(10) NOT NULL,
  `CustomerID` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `ShipToAddressID` INT NOT NULL,
  `BillToAddressID` INT NOT NULL,
  `ShipmentMethod` INT NOT NULL,
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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
