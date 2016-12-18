-- -----------------------------------------------------
-- Table `DM_Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DM_Time` (
  `DateID` INT NOT NULL AUTO_INCREMENT,
  `DayNumberOfMonth` INT NOT NULL,
  `MonthNumberOfYear` INT NOT NULL,
  `CalendarYear` INT NOT NULL,
  PRIMARY KEY (`DateID`))
ENGINE = InnoDB;
