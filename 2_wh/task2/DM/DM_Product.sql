-- -----------------------------------------------------
-- Table `DM_Product`
-- -----------------------------------------------------
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
