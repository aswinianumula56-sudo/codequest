```jsp
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("student-login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");

    Object xp = request.getAttribute("totalXP");
    if (xp == null) xp = request.getAttribute("total_xp");
    if (xp == null) xp = 0;

    Object level = request.getAttribute("level");
    if (level == null) level = request.getAttribute("player_level");
    if (level == null) level = 1;

    Object completed = request.getAttribute("completedMissions");
    if (completed == null) completed = request.getAttribute("completed");
    if (completed == null) completed = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CodeQuest - Student Dashboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: #E6E6FA;
            color: #32165A;
            min-height: 100vh;
        }

        nav {
            padding: 20px 4%;
            background: #D8C8F0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            border-bottom: 2px solid #B99AE8;
        }

        nav h2 {
            color: #5B2C91;
            font-size: 28px;
        }

        nav div {
            display: flex;
            align-items: center;
            gap: 28px;
            flex-wrap: wrap;
        }

        nav a {
            color: #4B247A;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
        }

        nav a:hover {
            color: #8957E5;
        }

        .container {
            max-width: 1250px;
            margin: auto;
            padding: 55px 35px;
        }

        .welcome {
            margin-bottom: 40px;
            text-align: center;
        }

        .welcome h1 {
            color: #5B2C91;
            font-size: 42px;
            margin-bottom: 15px;
        }

        .welcome p {
            color: #674A86;
            font-size: 18px;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .stat-card {
            background: linear-gradient(135deg, #7139C6, #51258F);
            padding: 32px;
            border-radius: 17px;
            border: 1px solid #8957E5;
            box-shadow: 0 8px 20px rgba(81, 37, 143, 0.2);
            transition: 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-8px);
        }

        .stat-card h3 {
            color: #F5EEFF;
            font-size: 21px;
            margin-bottom: 18px;
        }

        .stat-card h2 {
            color: white;
            font-size: 40px;
        }

        .mission-section {
            margin-top: 55px;
            padding: 40px 25px;
            background: #D5C5F1;
            border: 1px solid #B99AE8;
            border-radius: 17px;
            text-align: center;
        }

        .mission-section h2 {
            color: #5B2C91;
            font-size: 27px;
            margin-bottom: 15px;
        }

        .mission-section p {
            color: #674A86;
            font-size: 17px;
            margin-bottom: 25px;
        }

        .btn {
            display: inline-block;
            padding: 14px 32px;
            background: #7139C6;
            color: white;
            text-decoration: none;
            font-size: 17px;
            font-weight: bold;
            border-radius: 9px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #51258F;
            transform: scale(1.05);
        }

        footer {
            margin-top: 55px;
            padding: 22px;
            background: #D8C8F0;
            color: #4B247A;
            text-align: center;
            border-top: 1px solid #B99AE8;
        }

        @media(max-width: 850px) {
            .stats {
                grid-template-columns: 1fr;
            }
        }

        @media(max-width: 600px) {
            nav {
                flex-direction: column;
            }

            nav div {
                justify-content: center;
                gap: 16px;
            }

            .container {
                padding: 35px 18px;
            }

            .welcome h1 {
                font-size: 30px;
            }
        }
    </style>
</head>

<body>

    <nav>
        <h2>CodeQuest</h2>

        <div>
            <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
            <a href="<%= request.getContextPath() %>/dashboard">Dashboard</a>
            <a href="<%= request.getContextPath() %>/missions">Missions</a>
            <a href="<%= request.getContextPath() %>/leaderboard">Leaderboard</a>
            <a href="<%= request.getContextPath() %>/logout">Logout</a>
        </div>
    </nav>

    <div class="container">

        <section class="welcome">
            <h1>
                Welcome, <%= username != null ? username : "Student" %>!
            </h1>

            <p>Your coding progress at a glance.</p>
        </section>

        <section class="stats">

            <div class="stat-card">
                <h3>Total XP</h3>
                <h2><%= xp %></h2>
            </div>

            <div class="stat-card">
                <h3>Level</h3>
                <h2><%= level %></h2>
            </div>

            <div class="stat-card">
                <h3>Completed Missions</h3>
                <h2><%= completed %></h2>
            </div>

        </section>

        <section class="mission-section">
            <h2>Ready for Your Next Challenge?</h2>

            <p>
                Explore coding missions and improve your programming skills.
            </p>

            <a class="btn"
               href="<%= request.getContextPath() %>/missions">
                Start Missions
            </a>
        </section>

    </div>

    <footer>
        © 2026 CodeQuest | Learn • Practice • Achieve
    </footer>

</body>
</html>
```