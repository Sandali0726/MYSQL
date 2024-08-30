-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`students` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_registered` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `tags` VARCHAR(255) NOT NULL,
  `instructor_id` SMALLINT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_courses_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `school`.`instructor` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`instructor` (
  `instructor_id` SMALLINT NOT NULL,
  `name` VARCHAR(50) NULL,
  PRIMARY KEY (`instructor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`courses` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `tags` VARCHAR(255) NOT NULL,
  `instructor_id` SMALLINT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_courses_instructor1_idx` (`instructor_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_instructor1`
    FOREIGN KEY (`instructor_id`)
    REFERENCES `school`.`instructor` (`instructor_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`enrollments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`enrollments` (
  `course_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  `courses_course_id` INT NOT NULL,
  INDEX `fk_enrollments_students_idx` (`student_id` ASC) VISIBLE,
  PRIMARY KEY (`course_id`, `student_id`),
  INDEX `fk_enrollments_courses1_idx` (`courses_course_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollments_students`
    FOREIGN KEY (`student_id`)
    REFERENCES `school`.`students` (`student_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_courses`
    FOREIGN KEY ()
    REFERENCES `school`.`courses` ()
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollments_courses1`
    FOREIGN KEY (`courses_course_id`)
    REFERENCES `school`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`tags` (
  `tag_id` TINYINT NOT NULL,
  `Nmae` VARCHAR(50) NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school`.`course_tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school`.`course_tags` (
  `course_id` INT NOT NULL,
  `tag_id` TINYINT NOT NULL,
  INDEX `fk_course_tags_courses1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_course_tags_tags1_idx` (`tag_id` ASC) VISIBLE,
  PRIMARY KEY (`course_id`, `tag_id`),
  CONSTRAINT `fk_course_tags_courses1`
    FOREIGN KEY (`course_id`)
    REFERENCES `school`.`courses` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_tags_tags1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `school`.`tags` (`tag_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
