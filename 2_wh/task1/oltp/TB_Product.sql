-- Create table with product details for task 1
CREATE TABLE IF NOT EXISTS `TB_Product` (
  `ProductID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `ProductNumber` VARCHAR(16) NOT NULL,
  `StandardCost` DECIMAL(10,4) NOT NULL,
  `ListPrice` DECIMAL(10,4) NOT NULL,
  `Size` VARCHAR(16),
  `Weight` DECIMAL(10,4),
  `ProductCategoryID` INT NOT NULL,
  `ProductModelName` VARCHAR(45) NULL,
  `SellStartDate` TIMESTAMP NOT NULL,
  `SellEndDate` TIMESTAMP NULL,
  `DiscontinuedDate` TIMESTAMP NULL,
  PRIMARY KEY (`ProductID`),
  INDEX `FK_ProductCategory_idx` (`ProductCategoryID` ASC),
  CONSTRAINT `FK_ProductCategory`
    FOREIGN KEY (`ProductCategoryID`)
    REFERENCES `TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
