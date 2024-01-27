CREATE TABLE `users` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`dob` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_emails` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`email` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `user_mobile_numbers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`mobile_number` varchar(15) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `followers` (
	`id` int NOT NULL AUTO_INCREMENT,
	`follower_id` int NOT NULL,
	`followed_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `tweets` (
	`tweets_id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`content` TEXT NOT NULL,
	`created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp',
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`tweets_id`)
);

CREATE TABLE `retweets` (
	`retweet_id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`tweet_id` int NOT NULL,
	PRIMARY KEY (`retweet_id`)
);

CREATE TABLE `likes` (
	`likes_id` int NOT NULL AUTO_INCREMENT,
	`created_at` TIMESTAMP NOT NULL DEFAULT 'current_timestamp',
	`user_id` int NOT NULL,
	`tweet_id` int NOT NULL,
	PRIMARY KEY (`likes_id`)
);

ALTER TABLE `user_emails` ADD CONSTRAINT `user_emails_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `user_mobile_numbers` ADD CONSTRAINT `user_mobile_numbers_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `followers` ADD CONSTRAINT `followers_fk0` FOREIGN KEY (`follower_id`) REFERENCES `users`(`id`);

ALTER TABLE `followers` ADD CONSTRAINT `followers_fk1` FOREIGN KEY (`followed_id`) REFERENCES `users`(`id`);

ALTER TABLE `tweets` ADD CONSTRAINT `tweets_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `retweets` ADD CONSTRAINT `retweets_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `retweets` ADD CONSTRAINT `retweets_fk1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets`(`tweets_id`);

ALTER TABLE `likes` ADD CONSTRAINT `likes_fk0` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`);

ALTER TABLE `likes` ADD CONSTRAINT `likes_fk1` FOREIGN KEY (`tweet_id`) REFERENCES `tweets`(`tweets_id`);








