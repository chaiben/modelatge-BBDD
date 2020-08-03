-- MySQL Workbench Synchronization
-- Generated: 2020-08-03 15:00
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Marçal Machado Chaiben

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `modelaatgeBBDD` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `modelaatgeBBDD`.`proveidor` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `carrer` VARCHAR(255) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL,
  `piso` VARCHAR(10) NULL DEFAULT NULL,
  `porta` VARCHAR(10) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(15) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelaatgeBBDD`.`marca` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `proveidor_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `proveidor_id`),
  INDEX `fk_marca_proveidor1_idx` (`proveidor_id` ASC),
  CONSTRAINT `fk_marca_proveidor1`
    FOREIGN KEY (`proveidor_id`)
    REFERENCES `modelaatgeBBDD`.`proveidor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelaatgeBBDD`.`ulleres` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `graduacion_i` FLOAT(11) NOT NULL,
  `graduacion_d` FLOAT(11) NOT NULL,
  `muntura` ENUM('flotant', 'pasta', 'metàl.lica') NOT NULL,
  `color_muntura` VARCHAR(45) NOT NULL,
  `color_vidre_i` VARCHAR(45) NOT NULL,
  `color_vidre_d` VARCHAR(45) NOT NULL,
  `preu` FLOAT(11) NOT NULL,
  `marca_id` INT(11) NOT NULL,
  `client_id` INT(10) UNSIGNED NOT NULL,
  `empleat_id` INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `marca_id`, `client_id`, `empleat_id`),
  INDEX `fk_ulleres_marca1_idx` (`marca_id` ASC),
  INDEX `fk_ulleres_client1_idx` (`client_id` ASC),
  INDEX `fk_ulleres_empleat1_idx` (`empleat_id` ASC),
  CONSTRAINT `fk_ulleres_marca1`
    FOREIGN KEY (`marca_id`)
    REFERENCES `modelaatgeBBDD`.`marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_client1`
    FOREIGN KEY (`client_id`)
    REFERENCES `modelaatgeBBDD`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ulleres_empleat1`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `modelaatgeBBDD`.`empleat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelaatgeBBDD`.`client` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL,
  `carrer` VARCHAR(255) NULL DEFAULT NULL,
  `numero` VARCHAR(10) NULL DEFAULT NULL COMMENT '  ',
  `piso` VARCHAR(10) NULL DEFAULT NULL,
  `ciudad` VARCHAR(45) NULL DEFAULT NULL,
  `codi_postal` VARCHAR(15) NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `telefon` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `data_registre` DATETIME NOT NULL,
  `recomanat_client_id` INT(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `recomanat_client_id` (`recomanat_client_id` ASC),
  CONSTRAINT `id`
    FOREIGN KEY (`id`)
    REFERENCES `modelaatgeBBDD`.`client` (`recomanat_client_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `modelaatgeBBDD`.`empleat` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `modelaatgeBBDD`.`proveidor` (`nom`, `carrer`, `numero`, `porta`, `ciudad`, `codi_postal`, `pais`, `telefono`, `fax`, `nif`) VALUES ('Kost', 'C/ Ciencia', '35', 'Nave 7', 'Gava', '08850', 'España', '93 638 81 55', '93 638 81 55', '123456R');
INSERT INTO `modelaatgeBBDD`.`proveidor` (`nom`, `carrer`, `numero`, `piso`, `porta`, `ciudad`, `codi_postal`, `pais`, `telefono`, `nif`) VALUES ('Euro Optics bv', 'Petunialaan', '11', '1', 'A', 'HA Aalst Waalre', '5582', 'Paises Bajos', '34 952 47 73 58', '23456T');

INSERT INTO `modelaatgeBBDD`.`marca` (`nom`, `proveidor_id`) VALUES ('Ray-Ban', '1');
INSERT INTO `modelaatgeBBDD`.`marca` (`nom`, `proveidor_id`) VALUES ('Kost', '2');

INSERT INTO `modelaatgeBBDD`.`empleat` (`nom`) VALUES ('Marçal');

INSERT INTO `modelaatgeBBDD`.`client` (`nom`, `carrer`, `numero`, `piso`, `ciudad`, `codi_postal`, `pais`, `telefon`, `email`, `data_registre`) VALUES ('Carlos', 'Sant Roc', '50', '4', 'Barcelona', '08014', 'España', '666666444', 'carlos@gmail.com', '2020-08-03 15:29:30');
INSERT INTO `modelaatgeBBDD`.`client` (`nom`, `carrer`, `numero`, `piso`, `ciudad`, `codi_postal`, `pais`, `telefon`, `email`, `data_registre`, `recomanat_client_id`) VALUES ('Dan', 'C/ Valencia', '50', '4', 'Barcelona', '08007', 'España', '611466444', 'dan@gmail.com', '2020-08-03 16:29:30', '1');

INSERT INTO `modelaatgeBBDD`.`ulleres` (`graduacion_i`, `graduacion_d`, `muntura`, `color_muntura`, `color_vidre_i`, `color_vidre_d`, `preu`, `marca_id`, `client_id`, `empleat_id`) VALUES ('1.5', '1.0', 'pasta', 'vermell', 'transp', 'transp', '85.50', '2', '2', '1');
