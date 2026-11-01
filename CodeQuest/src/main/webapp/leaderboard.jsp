
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.ResultSet" %>

<%
    ResultSet rs = (ResultSet) request.getAttribute("leaders");
    int rank = 0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>CodeQuest - Leaderboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #101225;
            color: white;
            min-height: 100vh;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 5%;
            background-color: #24243e;
        }

        nav h2 {
            color: #c5aaff;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        nav a:hover {
            color: #c5aaff;
        }

        .content {
            width: 90%;
            max-width: 1100px;
            margin: 40px auto;
            text-align: center;
        }

        h1 {
            color: #c5aaff;
            font-size: 42px;
            margin-bottom: 35px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }

        th {
            background-color: #24243e;
            color: white;
            padding: 20px;
            font-size: 20px;
            border: 1px solid #ddd;
        }

        td {
            background-color: #f2f2f2;
            color: #222222;
            padding: 20px;
            font-size: 18px;
            font-weight: bold;
            border: 1px solid #ddd;
            text-align: center;
        }

        tr:nth-child(even) td {
            background-color: #e5e5ef;
        }

        tr:hover td {
            background-color: #d6d0ee;
        }

        @media(max-width: 600px) {
            .content {
                width: 96%;
                overflow-x: auto;
            }

            h1 {
                font-size: 28px;
            }

            table {
                min-width: 550px;
            }
        }
    </style>
</head>

<body>

<nav>
    <h2>CodeQuest</h2>

    <div>
        <a href="index.jsp">Home</a>
        <a href="login.jsp">Student Login</a>
        <a href="dashboard">Dashboard</a>
        <a href="leaderboard">Leaderboard</a>
    </div>
</nav>

<div class="content">

    <h1>Global Leaderboard</h1>

    <table>
        <tr>
            <th>Rank</th>
            <th>Student</th>
            <th>Level</th>
            <th>Completed</th>
            <th>Total XP</th>
        </tr>

        <%
            if (rs != null) {
                while (rs.next()) {
                    rank++;

                    String medal = rank == 1 ? "🥇" :
                                   rank == 2 ? "🥈" :
                                   rank == 3 ? "🥉" :
                                   String.valueOf(rank);
        %>

        <tr>
            <td><%= medal %></td>
            <td><%= rs.getString("username") %></td>
            <td><%= rs.getInt("player_level") %></td>
            <td><%= rs.getInt("completed") %></td>
            <td><%= rs.getInt("total_xp") %></td>
        </tr>

        <%
                }
            }

            if (rank == 0) {
        %>

        <tr>
            <td colspan="5">No players available yet.</td>
        </tr>

        <%
            }
        %>

    </table>

</div>

</body>
</html>
