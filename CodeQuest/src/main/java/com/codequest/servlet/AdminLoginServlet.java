
package com.codequest.servlet;

import com.codequest.DBConnection;
import com.codequest.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/admin-login")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String sql = "SELECT id, username, password_hash "
                   + "FROM admins WHERE username = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    String storedHash = rs.getString("password_hash");
                    String enteredHash = PasswordUtil.hash(password);

                    if (storedHash.equals(enteredHash)) {

                        HttpSession session = request.getSession();

                        session.setAttribute("adminId", rs.getInt("id"));
                        session.setAttribute("adminUsername",
                                rs.getString("username"));

                        response.sendRedirect(
                                request.getContextPath() + "/admin-dashboard");

                    } else {
                        request.setAttribute("error",
                                "Invalid username or password!");

                        request.getRequestDispatcher(
                                "/admin-login.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("error",
                            "Invalid username or password!");

                    request.getRequestDispatcher(
                            "/admin-login.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();

            throw new ServletException("Admin login failed.", e);
        }
    }
}
