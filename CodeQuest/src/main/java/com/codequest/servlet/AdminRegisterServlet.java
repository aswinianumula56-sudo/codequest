package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.codequest.DBConnection;
import com.codequest.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin-register")
public class AdminRegisterServlet extends HttpServlet {

    // Admin login అయినవారికి మాత్రమే registration page
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
            return;
        }

        request.getRequestDispatcher("/admin-register.jsp")
               .forward(request, response);
    }

    // కొత్త admin account create చేయడం
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/admin-login.jsp");
            return;
        }

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty()
                || password == null || password.isEmpty()) {

            response.sendRedirect(request.getContextPath()
                    + "/admin-register?error=empty");
            return;
        }

        String checkSql = "SELECT id FROM admins WHERE username = ?";
        String insertSql = "INSERT INTO admins (username, password_hash) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkPs = con.prepareStatement(checkSql)) {

            checkPs.setString(1, username.trim());

            try (ResultSet rs = checkPs.executeQuery()) {
                if (rs.next()) {
                    response.sendRedirect(request.getContextPath()
                            + "/admin-register?error=exists");
                    return;
                }
            }

            try (PreparedStatement insertPs = con.prepareStatement(insertSql)) {
                insertPs.setString(1, username.trim());
                insertPs.setString(2, PasswordUtil.hash(password));

                insertPs.executeUpdate();
            }

            response.sendRedirect(request.getContextPath()
                    + "/admin-register?success=1");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()
                    + "/admin-register?error=failed");
        }
    }
}