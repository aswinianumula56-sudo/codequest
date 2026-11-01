<%@ page contentType="text/html;charset=UTF-8" %>
<% if(session.getAttribute("userId")==null){ response.sendRedirect("login.jsp"); return; } %>
<!DOCTYPE html><html><head><title>Mission Result</title><link rel="stylesheet" href="css/style.css"></head><body>
<nav><h2>CodeQuest</h2><a href="dashboard">Dashboard</a></nav><div class="card">
<h2>Mission Result</h2><p><%=request.getAttribute("message")%></p>
<p>XP Awarded: <b><%=request.getAttribute("reward")%></b></p>
<a class="btn" href="missions">Back to Missions</a> <a class="btn" href="dashboard">Dashboard</a>
</div></body></html>