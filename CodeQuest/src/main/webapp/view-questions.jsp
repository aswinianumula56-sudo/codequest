
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.ResultSet" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    ResultSet rs =
        (ResultSet) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Questions - CodeQuest</title>

    <link rel="stylesheet" href="css/style.css">

    <style>
        .content {
            width: 95%;
            margin: 30px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 15px;
            border: 1px solid #444967;
            text-align: left;
        }

        th {
            background: #34395f;
            color: white;
        }

        td {
            color: white;
            background: #1e2340;
        }

        .delete-btn {
            background: #e53935;
            color: white;
            border: none;
            padding: 9px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background: #b71c1c;
        }

        .success {
            color: #4cff9b;
            margin: 15px 0;
        }

        .error {
            color: #ff7777;
            margin: 15px 0;
        }
    </style>
</head>

<body>

<nav>
    <h2>CodeQuest Admin</h2>

    <div>
        <a href="admin-dashboard.jsp">Dashboard</a>
        <a href="add-question.jsp">Add Question</a>
        <a href="admin-logout">Logout</a>
    </div>
</nav>

<div class="content">

    <h2>All Missions</h2>

    <% if ("1".equals(request.getParameter("added"))) { %>
        <p class="success">Question added successfully.</p>
    <% } %>

    <% if ("1".equals(request.getParameter("deleted"))) { %>
        <p class="success">Question deleted successfully.</p>
    <% } %>

    <% if ("attempted".equals(request.getParameter("error"))) { %>
        <p class="error">
            This question has student submissions.
            It cannot be deleted.
        </p>
    <% } %>

    <% if ("notfound".equals(request.getParameter("error"))) { %>
        <p class="error">Question not found.</p>
    <% } %>

    <table>

        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Category</th>
            <th>Difficulty</th>
            <th>XP</th>
            <th>Action</th>
        </tr>

        <%
            boolean hasQuestions = false;

            while (rs != null && rs.next()) {
                hasQuestions = true;
        %>

        <tr>
            <td><%= rs.getInt("id") %></td>

            <td><%= rs.getString("title") %></td>

            <td><%= rs.getString("category") %></td>

            <td><%= rs.getString("difficulty") %></td>

            <td><%= rs.getInt("xp_reward") %></td>

            <td>
                <form action="delete-question"
                      method="post"
                      onsubmit="return confirm('Are you sure you want to delete this question?');">

                    <input type="hidden"
                           name="id"
                           value="<%= rs.getInt("id") %>">

                    <button type="submit" class="delete-btn">
                        Delete
                    </button>

                </form>
            </td>
        </tr>

        <%
            }

            if (!hasQuestions) {
        %>

        <tr>
            <td colspan="6">No questions available.</td>
        </tr>

        <% } %>

    </table>

</div>

</body>
</html>
