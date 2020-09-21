-- MySQL Script generated by MySQL Workbench
-- sáb 19 set 2020 23:02:39
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema database
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `database` ;

-- -----------------------------------------------------
-- Schema database
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `database` DEFAULT CHARACTER SET utf8mb4 ;
USE `database` ;

-- -----------------------------------------------------
-- Table `database`.`tipos_pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`tipos_pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`pessoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo_pessoa_id` INT NOT NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pessoas_1_idx` (`tipo_pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoas_1`
    FOREIGN KEY (`tipo_pessoa_id`)
    REFERENCES `database`.`tipos_pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`telefones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`telefones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_id` INT NOT NULL,
  `ddd` VARCHAR(2) NOT NULL,
  `numero` VARCHAR(11) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_telefones_1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_telefones_1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`estados` (
  `id` VARCHAR(2) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`cidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`cidades` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `estado_id` VARCHAR(2) NOT NULL,
  `cep` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cidades_1_idx` (`estado_id` ASC) VISIBLE,
  CONSTRAINT `fk_cidades_1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `database`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`ruas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`ruas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NULL,
  `cep` VARCHAR(12) NULL,
  `cidade_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ruas_1_idx` (`cidade_id` ASC) VISIBLE,
  CONSTRAINT `fk_ruas_1`
    FOREIGN KEY (`cidade_id`)
    REFERENCES `database`.`cidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`pessoas_juridicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`pessoas_juridicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_id` INT NOT NULL,
  `razao_social` VARCHAR(100) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `inscricao_estadual` VARCHAR(20) NULL,
  `nome_fantazia` VARCHAR(100) NOT NULL,
  `status_id` INT NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pessoas_juridicas_1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoas_juridicas_1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`emails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`emails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_emails_1_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_emails_1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`grupos_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`grupos_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(255) NOT NULL,
  `apelido` VARCHAR(45) NULL,
  `pessoa_id` INT NULL,
  `token` VARCHAR(255) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `status_user_id` VARCHAR(45) NULL,
  `grupo_user_id` INT NOT NULL,
  `login` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_1_idx` (`pessoa_id` ASC) VISIBLE,
  INDEX `fk_users_2_idx` (`grupo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_2`
    FOREIGN KEY (`grupo_user_id`)
    REFERENCES `database`.`grupos_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`funcao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`funcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`pessoas_fisicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`pessoas_fisicas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cpf` VARCHAR(11) NOT NULL,
  `rg` VARCHAR(11) NULL,
  `nome` VARCHAR(100) NULL,
  `sexo` VARCHAR(1) NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NULL,
  `pessoa_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE,
  UNIQUE INDEX `pessoa_id_UNIQUE` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_pessoas_fisicas_1`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`colaboradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`colaboradores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_fisica_id` INT NOT NULL,
  `centro_custo_id` INT NOT NULL,
  `funcao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_colaboradores_1_idx` (`funcao_id` ASC) VISIBLE,
  INDEX `fk_colaboradores_2_idx` (`pessoa_fisica_id` ASC) VISIBLE,
  CONSTRAINT `fk_colaboradores_1`
    FOREIGN KEY (`funcao_id`)
    REFERENCES `database`.`funcao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_colaboradores_2`
    FOREIGN KEY (`pessoa_fisica_id`)
    REFERENCES `database`.`pessoas_fisicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`permissions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NULL,
  `permission_pai_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_permissions_1_idx` (`permission_pai_id` ASC) VISIBLE,
  CONSTRAINT `fk_permissions_1`
    FOREIGN KEY (`permission_pai_id`)
    REFERENCES `database`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`grupo_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`grupo_permissions` (
  `permission_id` INT NOT NULL,
  `grupo_user_id` INT NOT NULL,
  PRIMARY KEY (`permission_id`, `grupo_user_id`),
  INDEX `fk_grupo_permissions_2_idx` (`grupo_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_grupo_permissions_1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `database`.`permissions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_permissions_2`
    FOREIGN KEY (`grupo_user_id`)
    REFERENCES `database`.`grupos_users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`enderecos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`enderecos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `rua_id` INT NOT NULL,
  `pessoa_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_enderecos_1_idx` (`rua_id` ASC) VISIBLE,
  INDEX `fk_enderecos_2_idx` (`pessoa_id` ASC) VISIBLE,
  CONSTRAINT `fk_enderecos_1`
    FOREIGN KEY (`rua_id`)
    REFERENCES `database`.`ruas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enderecos_2`
    FOREIGN KEY (`pessoa_id`)
    REFERENCES `database`.`pessoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `database`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`empresas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pessoa_juridica_id` INT NOT NULL,
  `apelido` VARCHAR(5) NOT NULL,
  `empresa_matriz_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_empresas_1_idx` (`pessoa_juridica_id` ASC) VISIBLE,
  INDEX `fk_empresas_2_idx` (`empresa_matriz_id` ASC) VISIBLE,
  UNIQUE INDEX `apelido_UNIQUE` (`apelido` ASC) VISIBLE,
  CONSTRAINT `fk_empresas_1`
    FOREIGN KEY (`pessoa_juridica_id`)
    REFERENCES `database`.`pessoas_juridicas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_empresas_2`
    FOREIGN KEY (`empresa_matriz_id`)
    REFERENCES `database`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = big5;


-- -----------------------------------------------------
-- Table `database`.`centro_custos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `database`.`centro_custos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `empresa_id` INT NOT NULL,
  `centro_custo_pai_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_centro_custos_1_idx` (`empresa_id` ASC) VISIBLE,
  INDEX `fk_centro_custos_2_idx` (`centro_custo_pai_id` ASC) VISIBLE,
  CONSTRAINT `fk_centro_custos_1`
    FOREIGN KEY (`empresa_id`)
    REFERENCES `database`.`empresas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_centro_custos_2`
    FOREIGN KEY (`centro_custo_pai_id`)
    REFERENCES `database`.`centro_custos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
