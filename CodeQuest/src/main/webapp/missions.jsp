
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="java.sql.ResultSet" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    ResultSet rs = (ResultSet) request.getAttribute("missions");
    String message = (String) session.getAttribute("missionMessage");
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Programming Missions - CodeQuest</title>

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/css/style.css">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #101225 !important;
            color: #ffffff !important;
            font-family: Arial, sans-serif;
        }

        /* NAVBAR */

        nav {
            background: #24243e;
            color: white;
            padding: 16px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav h2 {
            color: #c5aaff;
            margin: 0;
        }

        nav a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
        }

        nav a:hover {
            color: #c5aaff;
        }

        /* MAIN CONTENT */

        .content {
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
        }

        .content h1 {
            color: #c5aaff;
            font-size: 38px;
            margin-bottom: 30px;
        }

        /* MISSION CARD */

        .mission {
            background: #24243e !important;
            color: #ffffff !important;
            padding: 28px;
            margin: 25px 0;
            border-radius: 12px;
            border: 1px solid #454568;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }

        .mission h3 {
            color: #c5aaff !important;
            font-size: 23px;
            margin-top: 0;
        }

        .mission p {
            color: #e0def5 !important;
            font-size: 17px;
            line-height: 1.6;
        }

        .mission b {
            color: #c5aaff;
        }

        /* OPTIONS */

        .mission label {
            display: flex !important;
            align-items: center;
            justify-content: flex-start;
            gap: 12px;

            padding: 15px;
            margin: 12px 0;

            background: #343653 !important;
            color: #ffffff !important;

            border: 1px solid #454568;
            border-radius: 8px;

            cursor: pointer;
            transition: 0.3s;

            text-align: left;
        }

        .mission label:hover {
            background: #454568 !important;
            border-color: #a78bfa;
        }

        /* RADIO BUTTON POSITION FIX */

        .mission input[type="radio"] {
            width: 18px !important;
            height: 18px;
            min-width: 18px;

            padding: 0 !important;
            margin: 0 !important;

            display: inline-block;
            flex-shrink: 0;

            accent-color: #a78bfa;
            cursor: pointer;
        }

        /* SUBMIT BUTTON */

        .mission button {
            padding: 13px 25px;
            margin-top: 15px;

            background: #8052e8;
            color: white;

            border: none;
            border-radius: 8px;

            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .mission button:hover {
            background: #6739cf;
            transform: translateY(-2px);
        }

        /* MESSAGE */

        .message {
            padding: 15px;
            margin: 15px 0;
            border-radius: 8px;
            background: #173d32;
            color: #72f0ad;
            border: 1px solid #267653;
            font-weight: bold;
        }

        /* RESPONSIVE */

        @media(max-width: 600px) {

            nav {
                flex-direction: column;
                gap: 15px;
            }

            nav a {
                margin: 8px;
            }

            .content {
                padding: 12px;
            }

            .content h1 {
                font-size: 28px;
            }

            .mission {
                padding: 18px;
            }

            .mission h3 {
                font-size: 19px;
            }

            .mission label {
                padding: 12px;
            }
        }

    </style>

</head>

<body>

    <!-- NAVBAR -->

    <nav>

        <h2>CodeQuest</h2>

        <div>
            <a href="dashboard">Dashboard</a>
            <a href="leaderboard">Leaderboard</a>
            <a href="logout">Logout</a>
        </div>

    </nav>


    <!-- MAIN CONTENT -->

    <div class="content">

        <h1>Programming Missions</h1>


        <!-- SUCCESS MESSAGE -->

        <% if (message != null) { %>

            <div class="message">
                <%= message %>
            </div>

            <%
                session.removeAttribute("missionMessage");
            %>

        <% } %>


        <!-- DISPLAY MISSIONS -->

        <%
            if (rs != null) {

                while (rs.next()) {

                    int id = rs.getInt("id");
        %>

        <div class="mission">

            <h3>
                <%= rs.getString("title") %>
            </h3>

            <p>
                <%= rs.getString("description") %>
            </p>

            <p>
                <b><%= rs.getString("category") %></b>
                |
                <%= rs.getString("difficulty") %>
            </p>


            <!-- ANSWER FORM -->

            <form action="<%= request.getContextPath() %>/submit-answer"
                  method="post">

                <input type="hidden"
                       name="mission_id"
                       value="<%= id %>">


                <!-- OPTION A -->

                <label>
                    <input type="radio"
                           name="answer"
                           value="A"
                           required>

                    <span>
                        A. <%= rs.getString("option_a") %>
                    </span>
                </label>


                <!-- OPTION B -->

                <label>
                    <input type="radio"
                           name="answer"
                           value="B">

                    <span>
                        B. <%= rs.getString("option_b") %>
                    </span>
                </label>


                <!-- OPTION C -->

                <label>
                    <input type="radio"
                           name="answer"
                           value="C">

                    <span>
                        C. <%= rs.getString("option_c") %>
                    </span>
                </label>


                <!-- OPTION D -->

                <label>
                    <input type="radio"
                           name="answer"
                           value="D">

                    <span>
                        D. <%= rs.getString("option_d") %>
                    </span>
                </label>


                <button type="submit">
                    Submit Answer
                </button>

            </form>

        </div>

        <%
                }
            }
        %>

    </div>

</body>
</html>
