ALTER TABLE `rootthebox`.`flag` 
ADD COLUMN `_case_sensitive` TINYINT(1) NULL DEFAULT 1 AFTER `_type`;
ALTER TABLE `rootthebox`.`flag` 
ADD COLUMN `lock_id` INT(11) NULL DEFAULT NULL AFTER `box_id`,
ADD INDEX `lock_id` (`lock_id` ASC);
ALTER TABLE `rootthebox`.`flag` 
ADD CONSTRAINT `flag_ibfk_2`
  FOREIGN KEY (`lock_id`)
  REFERENCES `rootthebox`.`flag` (`id`)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

ALTER TABLE `rootthebox`.`user` 
ADD COLUMN `_name` VARCHAR(64) NULL DEFAULT '' AFTER `_handle`;

ALTER TABLE `rootthebox`.`hint` 
ADD COLUMN `flag_id` INT(11) NULL AFTER `box_id`;
ALTER TABLE `rootthebox`.`hint` 
ADD INDEX `flag_id` (`flag_id` ASC);
ALTER TABLE `rootthebox`.`hint` 
DROP FOREIGN KEY `hint_ibfk_1`;
ALTER TABLE `rootthebox`.`hint` 
CHANGE COLUMN `box_id` `box_id` INT(11) NULL ;
ALTER TABLE `rootthebox`.`hint` 
ADD CONSTRAINT `hint_ibfk_1`
  FOREIGN KEY (`box_id`)
  REFERENCES `rootthebox`.`box` (`id`);
ALTER TABLE `rootthebox`.`hint` 
ADD CONSTRAINT `fk_hint_1`
  FOREIGN KEY (`flag_id`)
  REFERENCES `rootthebox`.`flag` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

CREATE TABLE `penalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `flag_id` int(11) NOT NULL,
  `_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `flag_id` (`flag_id`),
  CONSTRAINT `penalty_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`),
  CONSTRAINT `penalty_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

ALTER TABLE `rootthebox`.`game_level` 
ADD COLUMN `_type` VARCHAR(10) NOT NULL DEFAULT 'buyout' AFTER `_buyout`;

ALTER TABLE `rootthebox`.`game_level` 
ADD COLUMN `_reward` int(11) NOT NULL DEFAULT '0';
