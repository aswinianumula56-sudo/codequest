
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Student Registration</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background: #E6E6FA;
    min-height: 100vh;
}

/* Navbar */
.navbar {
    background: #D8C8F0;
    padding: 17px 35px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    color: #51258F;
    font-size: 24px;
    font-weight: bold;
}

.nav-links a {
    color: #51258F;
    text-decoration: none;
    font-weight: bold;
    margin-left: 20px;
}

/* Registration Section */
.register-page {
    min-height: calc(100vh - 60px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 25px 15px;
}

/* Registration Card */
.register-card {
    width: 100%;
    max-width: 400px;
    padding: 30px;
    background: linear-gradient(135deg, #7139C6, #51258F);
    border-radius: 18px;
    box-shadow: 0 8px 25px rgba(50,22,90,0.2);
    color: white;
}

.register-card h2 {
    text-align: center;
    color: white;
    margin-bottom: 25px;
}

.register-card label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
}

.register-card input {
    width: 100%;
    padding: 11px;
    margin-bottom: 17px;
    border: none;
    border-radius: 7px;
    background: #F8F5FF;
    outline: none;
}

.register-card button {
    width: 100%;
    padding: 12px;
    background: #D8C8F0;
    color: #51258F;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

.register-card button:hover {
    background: #E6E6FA;
}

.login-text {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
}

.login-text a {
    color: #E0C5FF;
    font-weight: bold;
    text-decoration: none;
}

.login-text a:hover {
    color: white;
}

@media(max-width: 500px) {
    .navbar {
        padding: 15px;
    }

    .register-card {
        padding: 23px;
    }
}
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar">

    <div class="logo">CodeQuest</div>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Login</a>
    </div>

</nav>

<!-- Registration Form -->
<main class="register-page">

    <div class="register-card">

        <h2>Student Registration</h2>

        <form action="<%= request.getContextPath() %>/register"
              method="post"
              onsubmit="return validatePassword()">

            <label>Username</label>
            <input type="text"
                   name="username"
                   placeholder="Enter username"
                   required>

            <label>Email</label>
            <input type="email"
                   name="email"
                   placeholder="Enter email"
                   required>

            <label>Password</label>
            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter password"
                   required>

            <label>Confirm Password</label>
            <input type="password"
                   id="confirmPassword"
                   placeholder="Confirm password"
                   required>

            <button type="submit">Register</button>

        </form>

        <p class="login-text">
            Already registered?
            <a href="<%= request.getContextPath() %>/login.jsp">
                Login
            </a>
        </p>

    </div>

</main>

<script>
function validatePassword() {

    let password =
        document.getElementById("password").value;

    let confirmPassword =
        document.getElementById("confirmPassword").value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
    }

    return true;
}
</script>

</body>
</html>
