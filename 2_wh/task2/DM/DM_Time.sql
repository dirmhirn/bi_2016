-- -----------------------------------------------------
-- Table `DM_Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DM_Time` (
  `DateID` INT NOT NULL,
  `DayNumberOfMonth` INT NOT NULL,
  `MonthNumberOfYear` INT NOT NULL,
  `CalendarYear` INT NOT NULL,
  PRIMARY KEY (`DateID`))
ENGINE = InnoDB;
