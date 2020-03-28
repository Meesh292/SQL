CREATE DATABASE IF NOT EXISTS app;
	
	USE app;

	DROP TABLE IF EXISTS users;
	DROP TABLE IF EXISTS posts;
	DROP TABLE IF EXISTS comments;
	
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
	email VARCHAR(40),
	password VARCHAR(15),
	PRIMARY KEY (username)
);


CREATE TABLE posts (
	post_content VARCHAR(255) NOT NULL,
	user_username VARCHAR(20) NOT NULL,
	post_time DATETIME,
	PRIMARY KEY (post_content),
	FOREIGN KEY (user_username) REFERENCES users(username)
);

CREATE TABLE comments (
	user_username VARCHAR(20) NOT NULL,
	post_post_content VARCHAR(255) NOT NULL,
	comment_time DATETIME,
	comment_content VARCHAR(255) NOT NULL,
	FOREIGN KEY (user_username) REFERENCES users(username),
	FOREIGN KEY (post_post_content) REFERENCES posts(post_content)
);

show databases;
use app;
show tables;
desc users;
desc posts;
desc comments;
