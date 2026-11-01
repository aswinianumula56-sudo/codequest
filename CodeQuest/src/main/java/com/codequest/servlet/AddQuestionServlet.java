
package com.codequest.servlet;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/add-question")
public class AddQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/admin-login.jsp");
            return;
        }

        String optionA = request.getParameter("option_a");
        String optionB = request.getParameter("option_b");
        String optionC = request.getParameter("option_c");
        String optionD = request.getParameter("option_d");

        String correctAnswer =
                request.getParameter("correct_answer");

        if (correctAnswer == null) {
            throw new ServletException("Correct answer is required.");
        }

        correctAnswer = correctAnswer.trim();

        // Accept either A/B/C/D or the complete option text.
        String correctOption;

        if (correctAnswer.equalsIgnoreCase("A") ||
            correctAnswer.equalsIgnoreCase("B") ||
            correctAnswer.equalsIgnoreCase("C") ||
            correctAnswer.equalsIgnoreCase("D")) {

            correctOption = correctAnswer.toUpperCase();

        } else if (correctAnswer.equals(optionA)) {
            correctOption = "A";

        } else if (correctAnswer.equals(optionB)) {
            correctOption = "B";

        } else if (correctAnswer.equals(optionC)) {
            correctOption = "C";

        } else if (correctAnswer.equals(optionD)) {
            correctOption = "D";

        } else {
            request.setAttribute("error",
                    "Correct answer must match one of the options.");

            request.getRequestDispatcher(
                    "/admin-dashboard.jsp").forward(request, response);
            return;
        }

        String sql = "INSERT INTO missions "
                + "(title, description, category, difficulty, "
                + "option_a, option_b, option_c, option_d, "
                + "correct_option, xp_reward) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, request.getParameter("title"));
            ps.setString(2, request.getParameter("description"));
            ps.setString(3, request.getParameter("category"));
            ps.setString(4, request.getParameter("difficulty"));

            ps.setString(5, optionA);
            ps.setString(6, optionB);
            ps.setString(7, optionC);
            ps.setString(8, optionD);

            ps.setString(9, correctOption);

            ps.setInt(10, Integer.parseInt(
                    request.getParameter("xp_reward")));

            ps.executeUpdate();

            response.sendRedirect(
                    request.getContextPath() + "/view-questions?added=1");

        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();

            throw new ServletException(
                    "Could not save question. Check all fields and database.", e);
        }
    }
}
