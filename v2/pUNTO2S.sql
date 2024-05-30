-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Actividad5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Actividad5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Actividad5` DEFAULT CHARACTER SET utf8 ;
USE `Actividad5` ;

-- -----------------------------------------------------
-- Table `Actividad5`.`Nave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Nave` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `fabricante` VARCHAR(45) NULL,
  `velMaxima` INT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad5`.`Piloto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Piloto` (
  `idPiloto` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `experiencia` VARCHAR(45) NULL,
  PRIMARY KEY (`idPiloto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad5`.`Maneja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Maneja` (
  `informe` VARCHAR(300) NULL,
  `codigoNave` INT NOT NULL,
  `idPiloto` INT NOT NULL,
  INDEX `fk1_idx` (`codigoNave` ASC) VISIBLE,
  PRIMARY KEY (`idPiloto`, `codigoNave`),
  CONSTRAINT `fk1`
    FOREIGN KEY (`codigoNave`)
    REFERENCES `Actividad5`.`Nave` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk2`
    FOREIGN KEY (`idPiloto`)
    REFERENCES `Actividad5`.`Piloto` (`idPiloto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad5`.`Recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Recurso` (
  `idRecurso` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `precio` INT NULL,
  `Nave_codigo` INT NOT NULL,
  PRIMARY KEY (`idRecurso`, `Nave_codigo`),
  INDEX `fk_Recurso_Nave1_idx` (`Nave_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Recurso_Nave1`
    FOREIGN KEY (`Nave_codigo`)
    REFERENCES `Actividad5`.`Nave` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad5`.`Mision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Mision` (
  `numero` INT NOT NULL,
  `descripcion` VARCHAR(250) NULL,
  `dificultad` VARCHAR(45) NULL,
  `nombreClave` VARCHAR(45) NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Actividad5`.`Participa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Actividad5`.`Participa` (
  `rol` VARCHAR(45) NULL,
  `codigoNave` INT NOT NULL,
  `numeroMision` INT NOT NULL,
  PRIMARY KEY (`codigoNave`, `numeroMision`),
  INDEX `fk2_idx` (`numeroMision` ASC) VISIBLE,
  CONSTRAINT `fk3`
    FOREIGN KEY (`codigoNave`)
    REFERENCES `Actividad5`.`Nave` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk4`
    FOREIGN KEY (`numeroMision`)
    REFERENCES `Actividad5`.`Mision` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

alter table Mision add estado boolean;
alter table Nave add estado boolean ;
alter table Piloto add estado boolean ;
alter table Recurso add estado boolean;

alter table Piloto add apodo varchar(20);
alter table Piloto add apellido varchar(30);

alter table Mision add fechaInicio date;