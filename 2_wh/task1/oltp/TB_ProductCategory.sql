-- Create table with Product Categories for task 1
CREATE TABLE IF NOT EXISTS `TB_ProductCategory` (
  `ProductCategoryID` INT NOT NULL,
  `ParentProductCategoryID` INT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ProductCategoryID`),
  INDEX `FK_ParentProductCategory_idx` (`ParentProductCategoryID` ASC),
  CONSTRAINT `FK_ParentProductCategory`
    FOREIGN KEY (`ParentProductCategoryID`)
    REFERENCES `TB_ProductCategory` (`ProductCategoryID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
