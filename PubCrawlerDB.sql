-- MySQL Script generated by MySQL Workbench
-- 10/30/16 16:59:16
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `email` INT NOT NULL,
  `passwd` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Address` (
  `idAddress` INT NOT NULL AUTO_INCREMENT,
  `number` INT NOT NULL COMMENT 'House Number (ie: 8309)',
  `street` VARCHAR(50) NOT NULL COMMENT 'Street Number or Name (ie: NE 82nd Ave)',
  `city` VARCHAR(50) NOT NULL,
  `State` VARCHAR(2) NOT NULL COMMENT 'State Abbreviation (ie: WA)',
  `zipcode` INT(10) NOT NULL,
  PRIMARY KEY (`idAddress`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Establishments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Establishments` (
  `name` VARCHAR(60) NOT NULL,
  `number_taps` INT(3) NOT NULL,
  `has_food` TINYINT(1) NOT NULL,
  `family_friendly` TINYINT(1) NOT NULL,
  `full_bar` TINYINT(1) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `image` VARCHAR(80) NOT NULL,
  `idAddress` INT NOT NULL,
  `Address_idAddress` INT NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_Establishments_Address_idx` (`Address_idAddress` ASC),
  CONSTRAINT `fk_Establishments_Address`
    FOREIGN KEY (`Address_idAddress`)
    REFERENCES `mydb`.`Address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;