-- -----------------------------------------------------
-- Table `DM_Time`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DM_Time` (
  `DateID` INT NOT NULL AUTO_INCREMENT,
  `DayNumberOfMonth` INT NULL,
  `MonthNumberOfYear` INT NULL,
  `CalendarYear` INT NULL,
  PRIMARY KEY (`DateID`),
  UNIQUE INDEX `UniqueDate` (`DayNumberOfMonth` ASC, `MonthNumberOfYear` ASC, `CalendarYear` ASC) USING HASH)
ENGINE = InnoDB;
