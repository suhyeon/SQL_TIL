
CREATE DATABASE `shop_mall`;

CREATE TABLE `shop_mall`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT default 1,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `id` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `birthday` DATE NULL,
  `gender` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));
  
  CREATE TABLE `shop_mall`.`category` (
  `category_id` INT NOT NULL AUTO_INCREMENT default 1,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`));
 
CREATE TABLE `cloth` (
  `cloth_id` INT NOT NULL AUTO_INCREMENT default 1,
  `cloth_name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `c_id` INT NOT NULL,
  PRIMARY KEY (`cloth_id`),
  CONSTRAINT `category_foreign`
	FOREIGN KEY(`c_id`) references `category`(`category_id`)
		on delete cascade
        on update cascade
 );
 
 CREATE TABLE `shop_mall`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT default 1,
  `u_id` INT NOT NULL,
  `c_id` INT NOT NULL,
  `price` INT NOT NULL,
  `many` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`cart_id`),
  INDEX `user_idx` (`u_id` ASC),
  INDEX `cloth_idx` (`c_id` ASC),
  CONSTRAINT `user`
    FOREIGN KEY (`u_id`)
    REFERENCES `shop_mall`.`user` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `cloth`
    FOREIGN KEY (`c_id`)
    REFERENCES `shop_mall`.`cloth` (`cloth_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE `shop_mall`.`status` (
  `status_id` INT NOT NULL AUTO_INCREMENT default 1,
  `status_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`status_id`));
  
  CREATE TABLE `shop_mall`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT default 1,
  `cart_id` INT NOT NULL,
  `total_price` INT NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `cart_idx` (`cart_id` ASC),
  INDEX `status_idx` (`status` ASC),
  CONSTRAINT `cart`
    FOREIGN KEY (`cart_id`)
    REFERENCES `shop_mall`.`cart` (`cart_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `status`
    FOREIGN KEY (`status`)
    REFERENCES `shop_mall`.`status` (`status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
