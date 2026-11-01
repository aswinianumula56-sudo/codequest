
package com.codequest.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/submit-answer")
public class SubmitAnswerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        int missionId;

        try {
            missionId = Integer.parseInt(
                    request.getParameter("mission_id"));
        } catch (Exception e) {
            response.sendRedirect("missions");
            return;
        }

        String answer = request.getParameter("answer");

        if (answer == null ||
                !answer.trim().matches("[ABCDabcd]")) {
            response.sendRedirect("missions");
            return;
        }

        answer = answer.trim().toUpperCase();

        try (Connection con = DBConnection.getConnection()) {

            con.setAutoCommit(false);

            try {
                // 1. Check whether user already attempted this mission
                String checkSql =
                        "SELECT id FROM mission_submissions "
                      + "WHERE user_id = ? AND mission_id = ?";

                try (PreparedStatement ps =
                        con.prepareStatement(checkSql)) {

                    ps.setInt(1, userId);
                    ps.setInt(2, missionId);

                    try (ResultSet rs = ps.executeQuery()) {

                        if (rs.next()) {
                            con.rollback();

                            session.setAttribute(
                                    "missionMessage",
                                    "You have already attempted this mission!");

                            response.sendRedirect("missions");
                            return;
                        }
                    }
                }

                // 2. Get correct option and XP reward
                String correct;
                int reward;

                String selectSql =
                        "SELECT correct_option, xp_reward "
                      + "FROM missions WHERE id = ?";

                try (PreparedStatement ps =
                        con.prepareStatement(selectSql)) {

                    ps.setInt(1, missionId);

                    try (ResultSet rs = ps.executeQuery()) {

                        if (!rs.next()) {
                            throw new ServletException(
                                    "Mission not found!");
                        }

                        correct = rs.getString("correct_option");
                        reward = rs.getInt("xp_reward");
                    }
                }

                // 3. Check submitted answer
                boolean isCorrect =
                        correct.trim().equalsIgnoreCase(answer);

                // 4. Save the first attempt
                String insertSql =
                        "INSERT INTO mission_submissions "
                      + "(user_id, mission_id, selected_option, is_correct) "
                      + "VALUES (?, ?, ?, ?)";

                try (PreparedStatement ps =
                        con.prepareStatement(insertSql)) {

                    ps.setInt(1, userId);
                    ps.setInt(2, missionId);
                    ps.setString(3, answer);
                    ps.setBoolean(4, isCorrect);

                    ps.executeUpdate();
                }

                // 5. Increase XP only for a correct answer
                if (isCorrect) {

                    String updateSql =
                            "UPDATE users SET "
                          + "level_no = FLOOR((xp + ?) / 100) + 1, "
                          + "xp = xp + ? "
                          + "WHERE id = ?";

                    try (PreparedStatement ps =
                            con.prepareStatement(updateSql)) {

                        ps.setInt(1, reward);
                        ps.setInt(2, reward);
                        ps.setInt(3, userId);

                        ps.executeUpdate();
                    }
                }

                // 6. Commit transaction
                con.commit();

                session.setAttribute(
                        "missionMessage",
                        isCorrect
                        ? "Correct answer! You earned " + reward + " XP."
                        : "Wrong answer! Better luck next time.");

                response.sendRedirect("missions");

            } catch (SQLIntegrityConstraintViolationException e) {

                con.rollback();

                session.setAttribute(
                        "missionMessage",
                        "You have already attempted this mission!");

                response.sendRedirect("missions");

            } catch (Exception e) {

                con.rollback();
                throw e;
            }

        } catch (Exception e) {

            throw new ServletException(
                    "Answer submission failed.", e);
        }
    }
}
