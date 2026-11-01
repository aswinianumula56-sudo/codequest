package com.codequest.servlet;

import com.codequest.DBConnection;
import com.codequest.PasswordUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String identity = request.getParameter("identity");
        String password = request.getParameter("password");
        String sql = "SELECT id,username FROM users WHERE (username=? OR email=?) AND password=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, identity);
            ps.setString(2, identity);
            ps.setString(3, PasswordUtil.hash(password == null ? "" : password));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession old = request.getSession(false);
                    if (old != null) old.invalidate();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("username", rs.getString("username"));
                    response.sendRedirect("dashboard");
                } else {
                    request.setAttribute("error", "Invalid username/email or password.");
                    request.getRequestDispatcher("/login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            throw new ServletException("Login failed. Check database connection.", e);
        }
    }
}
