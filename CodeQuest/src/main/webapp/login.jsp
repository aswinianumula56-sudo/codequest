
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CodeQuest | Student Login</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(110deg, #160b2d, #291044, #572092);
    color: white;
}

/* Navbar */

.navbar {
    min-height: 85px;
    padding: 0 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: linear-gradient(90deg, #190d32, #32175b);
    border-bottom: 1px solid #592b91;
}

.logo {
    font-size: 32px;
    font-weight: bold;
    color: white;
    text-decoration: none;
}

.logo span {
    color: #d09aff;
}

.nav-links {
    display: flex;
    gap: 25px;
}

.nav-links a {
    color: white;
    text-decoration: none;
    font-size: 17px;
    padding: 12px 18px;
    border-radius: 10px;
}

.nav-links a:hover,
.nav-links a.active {
    background: #7626d5;
    box-shadow: 0 0 18px #8e35ed;
}

/* Login Section */

.login-section {
    min-height: calc(100vh - 85px);
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 35px 20px;
}

.login-box {
    width: 100%;
    max-width: 430px;
    padding: 40px 35px;
    background: rgba(35, 17, 62, 0.95);
    border: 1px solid #8739c5;
    border-radius: 20px;
    box-shadow: 0 0 30px rgba(161, 44, 255, 0.3);
}

.login-box h1 {
    text-align: center;
    font-size: 32px;
    margin-bottom: 10px;
    color: #d09aff;
}

.subtitle {
    text-align: center;
    color: #ded2ed;
    margin-bottom: 30px;
    font-size: 15px;
}

/* Form */

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 9px;
    font-size: 15px;
    font-weight: 600;
}

.form-group input {
    width: 100%;
    padding: 14px;
    border: 1px solid #71409a;
    border-radius: 10px;
    outline: none;
    background: #1b1030;
    color: white;
    font-size: 15px;
}

.form-group input:focus {
    border-color: #c16bff;
    box-shadow: 0 0 10px rgba(193, 107, 255, 0.4);
}

.form-group input::placeholder {
    color: #a99ab9;
}

/* Login Button */

.login-btn {
    width: 100%;
    padding: 15px;
    margin-top: 10px;
    border: none;
    border-radius: 30px;
    background: linear-gradient(90deg, #a12cff, #7623d5);
    color: white;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 0 20px rgba(161, 44, 255, 0.5);
    transition: 0.3s;
}

.login-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 30px #a12cff;
}

.register-link {
    text-align: center;
    margin-top: 25px;
    color: #ded2ed;
    font-size: 15px;
}

.register-link a {
    color: #d09aff;
    text-decoration: none;
    font-weight: bold;
}

.register-link a:hover {
    text-decoration: underline;
}

@media(max-width: 600px) {
    .navbar {
        flex-direction: column;
        padding: 18px;
        gap: 15px;
    }

    .nav-links {
        gap: 10px;
        flex-wrap: wrap;
        justify-content: center;
    }

    .nav-links a {
        font-size: 14px;
        padding: 9px;
    }

    .login-box {
        padding: 30px 22px;
    }
}
</style>
</head>

<body>

<!-- Navbar -->

<nav class="navbar">

    <a href="index.jsp" class="logo">
        &lt;/&gt; <span>CodeQuest</span>
    </a>

    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp" class="active">Student Login</a>
    </div>

</nav>

<!-- Student Login Form -->

<section class="login-section">

    <div class="login-box">

        <h1>Student Login</h1>

        <p class="subtitle">
            Welcome back! Continue your coding journey.
        </p>

        <form action="<%= request.getContextPath() %>/login"
              method="post">

            <div class="form-group">
                <label>Username or Email</label>

                <input type="text"
                       name="identity"
                       placeholder="Enter your username or email"
                       required>
            </div>

            <div class="form-group">
                <label>Password</label>

                <input type="password"
                       name="password"
                       placeholder="Enter your password"
                       required>
            </div>

            <button type="submit" class="login-btn">
                Login
            </button>

        </form>

        <div class="register-link">
            Don't have an account?
            <a href="register.jsp">Register Now</a>
        </div>

    </div>

</section>

</body>
</html>
