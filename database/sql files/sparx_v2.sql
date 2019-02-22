CREATE TABLE `user` (
	`u_id` INT NOT NULL AUTO_INCREMENT,
	`f_name` varchar(50) NOT NULL,
	`l_name` varchar(50) NOT NULL,
	`pan_claim` varchar(255) UNIQUE,
	`pan_hash` varchar(255),
	`aadhar_claim` varchar(12) UNIQUE,
	`aadhar_hash` varchar(255),
	`dob_claim` DATE,
	`dob_hash` varchar(255),
	`income_claim` varchar(255),
	`income_hash` varchar(255),
	`address_line1` varchar(255),
	`address_line2` varchar(255),
	`address_city` varchar(255),
	`address_district` varchar(255),
	`address_state` varchar(255),
	`address_hash` varchar(255),
	PRIMARY KEY (`u_id`)
);

CREATE TABLE `roles` (
	`r_id` INT NOT NULL AUTO_INCREMENT,
	`s_id` INT NOT NULL,
	`role_id` INT NOT NULL,
	PRIMARY KEY (`r_id`)
);

CREATE TABLE `ministry` (
	`m_id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255),
	`category` varchar(255),
	PRIMARY KEY (`m_id`)
);

CREATE TABLE `stake_holders` (
	`s_id` INT NOT NULL AUTO_INCREMENT,
	`f_name` varchar(255) NOT NULL,
	`l_name` varchar(255),
	`ministry_id` INT,
	`position` varchar(255),
	PRIMARY KEY (`s_id`)
);

CREATE TABLE `schemes` (
	`scheme_id` INT NOT NULL,
	`title` varchar(255) NOT NULL,
	`ministry_id` INT NOT NULL,
	`description` varchar(255) NOT NULL,
	`criteria_id` INT NOT NULL,
	`status` INT NOT NULL,
	`approval_officer_level` varchar(255),
	`approved_hash` varchar(255),
	`rejection_officer_level` varchar(255),
	`rejected_hash` varchar(255),
	PRIMARY KEY (`scheme_id`)
);

CREATE TABLE `criteria` (
	`criteria_id` INT NOT NULL AUTO_INCREMENT,
	`income` varchar(255) NOT NULL,
	`location` varchar(255) NOT NULL,
	`caste` varchar(255) NOT NULL,
	PRIMARY KEY (`criteria_id`)
);

CREATE TABLE `other_rules_for_criteria` (
	`oth_id` INT NOT NULL AUTO_INCREMENT,
	`rules_for_criteria` INT NOT NULL,
	`description` TEXT,
	`response_type` INT,
	PRIMARY KEY (`oth_id`)
);

ALTER TABLE `roles` ADD CONSTRAINT `roles_fk0` FOREIGN KEY (`s_id`) REFERENCES `stake_holders`(`s_id`);

ALTER TABLE `stake_holders` ADD CONSTRAINT `stake_holders_fk0` FOREIGN KEY (`ministry_id`) REFERENCES `ministry`(`m_id`);

ALTER TABLE `schemes` ADD CONSTRAINT `schemes_fk0` FOREIGN KEY (`ministry_id`) REFERENCES `ministry`(`m_id`);

ALTER TABLE `schemes` ADD CONSTRAINT `schemes_fk1` FOREIGN KEY (`criteria_id`) REFERENCES `criteria`(`criteria_id`);

ALTER TABLE `other_rules_for_criteria` ADD CONSTRAINT `other_rules_for_criteria_fk0` FOREIGN KEY (`rules_for_criteria`) REFERENCES `criteria`(`criteria_id`);

