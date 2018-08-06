-- create database
DROP DATABASE IF EXISTS waywardblog;
CREATE DATABASE waywardblog;
USE waywardblog;

-- add user
-- DROP USER 'waywardblog'@'localhost';
-- CREATE USER 'waywardblog'@'localhost' IDENTIFIED BY 'waywardblog';
-- GRANT ALL PRIVILEGES ON waywardblog.* TO 'waywardblog'@'localhost';

-- Build Tables
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(64) NOT NULL,
  `lName` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL UNIQUE,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `user` (fName, lName, email, password) 
  VALUES ('Bob', 'Bobbers', 'bob@bob.com', 'bob');

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author`(
  `authorId` int(11) NOT NULL AUTO_INCREMENT,
  `name`  varchar(255),
  PRIMARY KEY (`authorId`)
);

INSERT INTO `author` (name) VALUES('Ol\' Bobby Bobbers');

DROP TABLE IF EXISTS `blogpost`;
CREATE TABLE `blogpost`(
  `postId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`postId`),
  FOREIGN KEY (`authorId`)
    REFERENCES `author` (`authorId`)
);

INSERT INTO `blogpost` (title, text, authorId)
  VALUES ('Hipster Ipsum', 'Lorem ipsum dolor amet seitan venmo distillery palo santo VHS 8-bit sriracha. YOLO church-key post-ironic copper mug cold-pressed schlitz bespoke sartorial bushwick chambray fingerstache seitan you probably haven\'t heard of them. Jianbing echo park heirloom skateboard offal fashion axe artisan. Synth photo booth austin pork belly hella. Selfies street art locavore copper mug pok pok small batch cred jianbing brooklyn drinking vinegar squid. Banh mi fam mixtape roof party succulents synth PBR&B pork belly. Church-key migas single-origin coffee pork belly, taxidermy squid shabby chic echo park slow-carb.

Sartorial vexillologist wayfarers semiotics farm-to-table mumblecore kale chips green juice meditation tacos adaptogen iPhone. Selvage ugh meh pitchfork hammock. Pabst vegan 90\'s street art plaid cray banh mi cred man bun live-edge farm-to-table. Twee you probably haven\'t heard of them etsy, polaroid biodiesel iceland tilde beard pour-over ethical pitchfork direct trade. Yr leggings hammock man braid raw denim, hexagon organic affogato tumeric pour-over snackwave chartreuse cloud bread. Sustainable scenester pug twee hella flannel activated charcoal yuccie, snackwave cornhole lomo pabst single-origin coffee pickled. Aesthetic gochujang helvetica pour-over, kombucha drinking vinegar XOXO synth 90\'s cardigan slow-carb flexitarian.

Oh. You need a little dummy text for your mockup? How quaint.

I bet you’re still using Bootstrap too…', 1);
