-- Create table with order details for task 1
CREATE TABLE IF NOT EXISTS `TB_SalesOrderDetail` (
  `SalesOrderID` INT NOT NULL,
  `SalesOrderDetailID` INT NOT NULL,
  `OrderQty` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `UnitPrice` DECIMAL(10,4) NOT NULL,
  PRIMARY KEY (`SalesOrderID`, `SalesOrderDetailID`),
  INDEX `FK_Product_idx` (`ProductID` ASC),
  CONSTRAINT `FK_SalesOrder`
    FOREIGN KEY (`SalesOrderID`)
    REFERENCES `TB_SalesOrderHeader` (`SalesOrderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Product`
    FOREIGN KEY (`ProductID`)
    REFERENCES `TB_Product` (`ProductID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
