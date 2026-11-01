<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Registration - CodeQuest</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #101225, #29204b);
            color: white;
        }

        .container {
            width: 360px;
            padding: 35px;
            background: #24243e;
            border-radius: 18px;
            box-shadow: 0 10px 35px rgba(0,0,0,0.4);
        }

        h2 {
            text-align: center;
            color: #c5aaff;
        }

        input {
            width: 100%;
            padding: 13px;
            margin: 12px 0;
            border: 1px solid #555;
            border-radius: 8px;
            background: #343653;
            color: white;
        }

        button {
            width: 100%;
            padding: 13px;
            margin-top: 15px;
            background: #8957e5;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background: #a477f5;
        }

        .message {
            text-align: center;
            margin: 12px 0;
            font-size: 14px;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #c5aaff;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

    <h2>Create New Admin</h2>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <p class="message" style="color:#69e6a6;">
            Admin account created successfully!
        </p>
    <% } %>

    <% if ("exists".equals(request.getParameter("error"))) { %>
        <p class="message" style="color:#ff7777;">
            This username already exists!
        </p>
    <% } %>

    <% if ("empty".equals(request.getParameter("error"))) { %>
        <p class="message" style="color:#ff7777;">
            Please enter all details.
        </p>
    <% } %>

    <% if ("failed".equals(request.getParameter("error"))) { %>
        <p class="message" style="color:#ff7777;">
            Registration failed. Please try again.
        </p>
    <% } %>

    <form action="<%= request.getContextPath() %>/admin-register"
          method="post">

        <input type="text"
               name="username"
               placeholder="Enter Admin Username"
               required>

        <input type="password"
               name="password"
               placeholder="Enter Admin Password"
               required>

        <button type="submit">Create Admin Account</button>

    </form>

    <a href="<%= request.getContextPath() %>/admin-dashboard">
        Back to Admin Dashboard
    </a>

</div>

</body>
</html>