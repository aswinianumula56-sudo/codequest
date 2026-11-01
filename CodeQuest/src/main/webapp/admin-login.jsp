
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>CodeQuest | Admin Login</title>

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', Arial, sans-serif;
}

body {
    min-height: 100vh;
    background: #e8e8fa;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    width: 500px;
    max-width: 92%;
    padding: 38px 40px;
    background: linear-gradient(135deg, #7139c7, #55258f);
    border-radius: 22px;
    box-shadow: 0 15px 35px rgba(55, 20, 100, 0.25);
}

h1 {
    text-align: center;
    color: white;
    font-size: 32px;
    margin-bottom: 28px;
}

.form-group {
    margin-bottom: 22px;
}

label {
    display: block;
    color: white;
    font-size: 19px;
    font-weight: bold;
    margin-bottom: 9px;
}

input {
    width: 100%;
    padding: 16px;
    border: none;
    outline: none;
    border-radius: 11px;
    background: #e8efff;
    color: #222;
    font-size: 16px;
}

.login-btn {
    width: 100%;
    padding: 15px;
    margin-top: 3px;
    border: none;
    border-radius: 11px;
    background: #d9c7f0;
    color: #55258f;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.login-btn:hover {
    background: white;
    transform: translateY(-2px);
}

.back-link {
    text-align: center;
    margin-top: 23px;
}

.back-link a {
    color: white;
    text-decoration: none;
    font-size: 15px;
}

.back-link a:hover {
    text-decoration: underline;
}

@media(max-width: 500px) {
    .login-container {
        padding: 30px 22px;
    }
}
</style>
</head>

<body>

<div class="login-container">

    <h1>Admin Login</h1>

    <form action="<%= request.getContextPath() %>/admin-login"
          method="post">

        <div class="form-group">
            <label>Username</label>

            <input type="text"
                   name="username"
                   placeholder="Enter username"
                   required>
        </div>

        <div class="form-group">
            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter password"
                   required>
        </div>

        <button type="submit" class="login-btn">
            Login
        </button>

    </form>

    <div class="back-link">
        <a href="index.jsp">← Back to Home</a>
    </div>

</div>

</body>
</html>
