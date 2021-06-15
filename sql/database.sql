-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rehoboth
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rehoboth
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rehoboth` DEFAULT CHARACTER SET utf8 ;
USE `rehoboth` ;

-- -----------------------------------------------------
-- Table `rehoboth`.`r_booknames`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_booknames` (
  `id_booknames` INT NOT NULL,
  `bookname` VARCHAR(45) NULL,
  `bookname_pkey` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`bookname_pkey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rehoboth`.`r_chapter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_chapter` (
  `chapter_pkey` INT NOT NULL AUTO_INCREMENT,
  `chaptername` VARCHAR(45) NULL,
  `r_booknames_bookname_pkey` INT NOT NULL,
  PRIMARY KEY (`chapter_pkey`),
  INDEX `fk_r_chapter_r_booknames_idx` (`r_booknames_bookname_pkey` ASC) VISIBLE,
  CONSTRAINT `fk_r_chapter_r_booknames`
    FOREIGN KEY (`r_booknames_bookname_pkey`)
    REFERENCES `rehoboth`.`r_booknames` (`bookname_pkey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rehoboth`.`r_verses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_verses` (
  `verses_pkey` INT NOT NULL AUTO_INCREMENT,
  `id_verses` INT NULL,
  `versestext` VARCHAR(45) NULL,
  `r_chapter_chapter_pkey` INT NOT NULL,
  PRIMARY KEY (`verses_pkey`),
  INDEX `fk_r_verses_r_chapter1_idx` (`r_chapter_chapter_pkey` ASC) VISIBLE,
  CONSTRAINT `fk_r_verses_r_chapter1`
    FOREIGN KEY (`r_chapter_chapter_pkey`)
    REFERENCES `rehoboth`.`r_chapter` (`chapter_pkey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rehoboth`.`r_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_users` (
  `user_pkey` INT NOT NULL AUTO_INCREMENT,
  `user_firstname` VARCHAR(45) NULL,
  `user_lastname` VARCHAR(45) NULL,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  `user_birthday` VARCHAR(45) NULL,
  `user_gender` VARCHAR(45) NULL,
  `user_address` VARCHAR(45) NULL,
  `user_address` VARCHAR(45) NULL,
  `user_city` VARCHAR(45) NULL,
  `user_country` VARCHAR(45) NULL,
  `user_zip` VARCHAR(45) NULL,
  `user_email` VARCHAR(45) NULL,
  `user_telephone` INT NULL,
  PRIMARY KEY (`user_pkey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rehoboth`.`r_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_items` (
  `item_pkey` INT NOT NULL,
  `item_name` VARCHAR(45) NULL,
  `item_count` INT NULL,
  `item_price` DECIMAL NULL,
  PRIMARY KEY (`item_pkey`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rehoboth`.`r_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rehoboth`.`r_order` (
  `order_pkey` INT NOT NULL,
  `order_id` INT NULL,
  `order_itemquantity` INT NULL,
  `order_itemprice` DECIMAL NULL,
  `r_users_user_pkey` INT NOT NULL,
  `r_items_item_pkey` INT NOT NULL,
  PRIMARY KEY (`order_pkey`),
  INDEX `fk_r_order_r_users1_idx` (`r_users_user_pkey` ASC) VISIBLE,
  INDEX `fk_r_order_r_items1_idx` (`r_items_item_pkey` ASC) VISIBLE,
  CONSTRAINT `fk_r_order_r_users1`
    FOREIGN KEY (`r_users_user_pkey`)
    REFERENCES `rehoboth`.`r_users` (`user_pkey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_r_order_r_items1`
    FOREIGN KEY (`r_items_item_pkey`)
    REFERENCES `rehoboth`.`r_items` (`item_pkey`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
