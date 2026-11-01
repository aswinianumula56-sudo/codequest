
package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.codequest.DBConnection;
import com.codequest.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword =
                request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error",
                    "Passwords do not match!");
            request.getRequestDispatcher("register.jsp")
                   .forward(request, response);
            return;
        }

        try {
        	String hashedPassword =
        	        PasswordUtil.hash(password);
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users "
                    + "(username, email, password) "
                    + "VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, hashedPassword);

            int result = ps.executeUpdate();

            ps.close();
            con.close();

            if (result > 0) {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(
                    "Registration failed: " + e.getMessage());
        }
    }
}
