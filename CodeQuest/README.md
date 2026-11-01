# CodeQuest – Programming Learning Game

## Requirements
- JDK 17
- Apache Tomcat 10.1
- MySQL 8+
- Eclipse IDE for Enterprise Java and Web Developers
- Maven (Eclipse includes Maven integration)

## 1. Create database
Open MySQL Workbench and run `database/codequest_db.sql`.

## 2. Configure database
Open `src/main/java/com/codequest/DBConnection.java` and set your MySQL username/password.
Do not commit real passwords to a public GitHub repository.

## 3. Import into Eclipse
File → Import → Maven → Existing Maven Projects → select this folder → Finish.
Right-click project → Maven → Update Project.
Add Apache Tomcat 10.1 server in the Servers tab.

## 4. Run
Right-click project → Run As → Run on Server → select Tomcat 10.1.
Open `http://localhost:8080/CodeQuest/`

## Demo admin
Username: `admin`
Password: `admin123`

The starter stores admin password as SHA-256 in the SQL script. Student passwords are SHA-256 hashed in Java.
For a production application, use BCrypt/Argon2, HTTPS, CSRF protection, validation, rate limiting and externalized secrets.

## XP / levels
Every correct answer awards the XP reward set by the admin. Level is calculated as `1 + total_xp / 100`.
A student can submit each mission once, enforced by a unique database constraint.
