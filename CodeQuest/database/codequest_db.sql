CREATE DATABASE IF NOT EXISTS codequest_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE codequest_db;

CREATE TABLE users (
 id INT PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(50) NOT NULL UNIQUE,
 email VARCHAR(100) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL,
 total_xp INT NOT NULL DEFAULT 0,
 player_level INT NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admins (
 id INT PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(50) NOT NULL UNIQUE,
 password VARCHAR(255) NOT NULL
);

CREATE TABLE missions (
 id INT PRIMARY KEY AUTO_INCREMENT,
 title VARCHAR(100) NOT NULL,
 description TEXT,
 category VARCHAR(30) NOT NULL,
 difficulty VARCHAR(20) NOT NULL,
 option_a VARCHAR(255) NOT NULL,
 option_b VARCHAR(255) NOT NULL,
 option_c VARCHAR(255) NOT NULL,
 option_d VARCHAR(255) NOT NULL,
 correct_answer VARCHAR(255) NOT NULL,
 xp_reward INT NOT NULL DEFAULT 50,
 created_by INT,
 CONSTRAINT fk_mission_admin FOREIGN KEY (created_by) REFERENCES admins(id)
);

CREATE TABLE mission_submissions (
 id INT PRIMARY KEY AUTO_INCREMENT,
 user_id INT NOT NULL,
 mission_id INT NOT NULL,
 answer VARCHAR(255) NOT NULL,
 is_correct BOOLEAN NOT NULL DEFAULT FALSE,
 completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_submission_user FOREIGN KEY (user_id) REFERENCES users(id),
 CONSTRAINT fk_submission_mission FOREIGN KEY (mission_id) REFERENCES missions(id),
 CONSTRAINT uq_user_mission UNIQUE (user_id, mission_id)
);

-- Demo admin. Password is "admin123" (stored as SHA-256 by this starter project).
INSERT INTO admins(username,password)
VALUES ('admin', SHA2('admin123',256))
ON DUPLICATE KEY UPDATE username=username;

-- Optional sample mission
INSERT INTO missions(title,description,category,difficulty,option_a,option_b,option_c,option_d,correct_answer,xp_reward,created_by)
SELECT 'Java is platform independent because of?', 'Choose the correct reason.', 'Java', 'Easy',
       'JVM', 'HTML', 'CSS', 'MySQL', 'JVM', 50, id
FROM admins WHERE username='admin'
AND NOT EXISTS (SELECT 1 FROM missions WHERE title='Java is platform independent because of?');
