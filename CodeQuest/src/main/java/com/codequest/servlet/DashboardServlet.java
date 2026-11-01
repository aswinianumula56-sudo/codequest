package com.codequest.servlet;

import com.codequest.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp"); return;
        }
        int userId = (Integer) session.getAttribute("userId");
        String sql = "SELECT u.username, "
                + "u.xp AS total_xp, "
                + "u.level_no AS player_level, "
                + "(SELECT COUNT(*) FROM mission_submissions s "
                + "WHERE s.user_id = u.id AND s.is_correct = TRUE) "
                + "AS completed "
                + "FROM users u WHERE u.id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    request.setAttribute("username", rs.getString("username"));
                    request.setAttribute("xp", rs.getInt("total_xp"));
                    request.setAttribute("level", rs.getInt("player_level"));
                    request.setAttribute("completed", rs.getInt("completed"));
                }
            }
            request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new ServletException("Unable to load dashboard.", e);
        }
    }
}
