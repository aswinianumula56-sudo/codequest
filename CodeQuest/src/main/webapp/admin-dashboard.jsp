```jsp
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>CodeQuest Admin Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        body {
            margin: 0;
            background: #101225;
            color: white;
            font-family: Arial, sans-serif;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 35px;
            background: #20213e;
            flex-wrap: wrap;
            gap: 15px;
        }

        nav h2 {
            color: #b99aff;
            margin: 0;
        }

        nav div {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 16px;
        }

        nav a:hover {
            color: #b99aff;
        }

        .welcome {
            text-align: center;
            padding: 75px 20px 45px;
        }

        .welcome h1 {
            color: #c5aaff;
            font-size: 46px;
            margin-bottom: 15px;
        }

        .welcome p {
            color: #d5d1e5;
            font-size: 19px;
        }

        .dashboard-cards {
            display: flex;
            justify-content: center;
            gap: 30px;
            padding: 30px 25px 70px;
            flex-wrap: wrap;
        }

        .card {
            width: 280px;
            padding: 30px 22px;
            text-align: center;
            background: #24243e;
            border: 1px solid #454267;
            border-radius: 15px;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-8px);
            border-color: #a477f5;
            box-shadow: 0 8px 25px rgba(137,87,229,0.2);
        }

        .card h2 {
            color: #c5aaff;
            font-size: 22px;
        }

        .card p {
            color: #ccc;
            line-height: 1.7;
        }

        .card a {
            display: inline-block;
            margin-top: 12px;
            padding: 11px 20px;
            background: #8957e5;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .card a:hover {
            background: #a477f5;
        }

        .footer {
            text-align: center;
            padding: 20px;
            color: #aaa;
            background: #20213e;
        }

        @media(max-width: 600px) {
            nav {
                flex-direction: column;
            }

            nav div {
                justify-content: center;
                gap: 15px;
            }

            .welcome h1 {
                font-size: 34px;
            }
        }
    </style>
</head>

<body>

<nav>
    <h2>CodeQuest Admin</h2>

    <div>
        <a href="admin-dashboard.jsp">Dashboard</a>
        <a href="add-question.jsp">Add Question</a>
        <a href="view-questions">View Questions</a>
        <a href="admin-register">Create New Admin</a>
        <a href="admin-logout">Logout</a>
    </div>
</nav>

<section class="welcome">

    <h1>
        Welcome, <%= session.getAttribute("adminUsername") %>!
    </h1>

    <p>Explore, Create and Manage Coding Challenges.</p>

</section>

<section class="dashboard-cards">

    <div class="card">
        <h2>📝 Add Questions</h2>

        <p>
            Create coding missions in C, C++, Java, Python,
            JavaScript, HTML, CSS, SQL, PHP, Kotlin and more.
            Add questions with different difficulty levels
            and XP rewards.
        </p>

        <a href="add-question.jsp">Add Question</a>
    </div>

    <div class="card">
        <h2>📚 Manage Questions</h2>

        <p>
            View, organize and manage all your coding
            questions across different programming
            languages and technologies.
        </p>

        <a href="view-questions">View Questions</a>
    </div>

</section>

<div class="footer">
    © 2026 CodeQuest | Admin Dashboard
</div>

</body>
</html>
```