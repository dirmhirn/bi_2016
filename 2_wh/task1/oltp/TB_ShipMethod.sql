-- Create table for Shipping Methods for task 1
CREATE TABLE IF NOT EXISTS `TB_ShipMethod` (
  `ShipMethodID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `CostPerShipment` DECIMAL(10,0) NOT NULL,
  `CostPerUnit` DECIMAL(10,0) NOT NULL,
  `BulkyItemSurcharge` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`ShipMethodID`))
ENGINE = InnoDB;
