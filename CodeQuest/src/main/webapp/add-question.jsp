
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
    <title>Add Question - CodeQuest</title>

    <link rel="stylesheet" href="css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

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

        .container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 35px;
            background: #20213e;
            border-radius: 15px;
            border: 1px solid #454267;
        }

        h1 {
            text-align: center;
            color: #c5aaff;
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 10px;
            font-size: 18px;
            color: #ddd;
        }

        input, textarea, select {
            width: 100%;
            padding: 15px;
            border: 1px solid #555675;
            border-radius: 10px;
            background: #101225;
            color: white;
            font-size: 16px;
            outline: none;
        }

        input:focus, textarea:focus, select:focus {
            border-color: #a477f5;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        select option {
            background: #20213e;
            color: white;
        }

        .submit-btn {
            display: block;
            width: 100%;
            margin-top: 30px;
            padding: 15px;
            background: #8957e5;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #a477f5;
        }

        .back-btn {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #c5aaff;
            text-decoration: none;
        }

        .back-btn:hover {
            text-decoration: underline;
        }

        @media(max-width: 600px) {
            nav {
                flex-direction: column;
            }

            nav div {
                justify-content: center;
                gap: 15px;
            }

            .container {
                margin: 20px 12px;
                padding: 20px;
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

<div class="container">

    <h1>📝 Add New Coding Question</h1>

    <form action="<%= request.getContextPath() %>/add-question"
          method="post">

        <label>Question Title</label>
        <input type="text"
               name="title"
               placeholder="Enter question title"
               required>

        <label>Question Description</label>
        <textarea name="description"
                  placeholder="Enter question description"
                  required></textarea>

        <label>Category</label>

        <select name="category" required>
            <option value="">Select Category</option>
            <option value="C">C</option>
            <option value="C++">C++</option>
            <option value="Java">Java</option>
            <option value="Python">Python</option>
            <option value="JavaScript">JavaScript</option>
            <option value="HTML">HTML</option>
            <option value="CSS">CSS</option>
            <option value="SQL">SQL</option>
            <option value="DSA">DSA</option>
            <option value="Algorithms">Algorithms</option>
            <option value="PHP">PHP</option>
            <option value="Kotlin">Kotlin</option>
            <option value="C#">C#</option>
            <option value="Data Science">Data Science</option>
            <option value="Machine Learning">Machine Learning</option>
        </select>

        <label>Difficulty Level</label>

        <select name="difficulty" required>
            <option value="">Select Difficulty</option>
            <option value="Easy">Easy</option>
            <option value="Medium">Medium</option>
            <option value="Hard">Hard</option>
        </select>

        <label>Option A</label>
        <input type="text"
               name="option_a"
               placeholder="Enter Option A"
               required>

        <label>Option B</label>
        <input type="text"
               name="option_b"
               placeholder="Enter Option B"
               required>

        <label>Option C</label>
        <input type="text"
               name="option_c"
               placeholder="Enter Option C"
               required>

        <label>Option D</label>
        <input type="text"
               name="option_d"
               placeholder="Enter Option D"
               required>

        <label>Correct Answer</label>

        <select name="correct_answer" required>
            <option value="">Select Correct Answer</option>
            <option value="A">Option A</option>
            <option value="B">Option B</option>
            <option value="C">Option C</option>
            <option value="D">Option D</option>
        </select>

        <label>XP Reward</label>
        <input type="number"
               name="xp_reward"
               min="1"
               placeholder="Enter XP points"
               required>

        <button type="submit" class="submit-btn">
            Add Question
        </button>

    </form>

    <a href="admin-dashboard.jsp" class="back-btn">
        ← Back to Dashboard
    </a>

</div>

</body>
</html>
