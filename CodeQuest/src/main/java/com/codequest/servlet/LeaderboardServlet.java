
package com.codequest.servlet;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/leaderboard")
public class LeaderboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String sql =
                "SELECT u.username, " +
                "u.xp AS total_xp, " +
                "u.level_no AS player_level, " +
                "(SELECT COUNT(*) FROM mission_submissions s " +
                "WHERE s.user_id = u.id " +
                "AND s.is_correct = TRUE) AS completed " +
                "FROM users u " +
                "ORDER BY u.xp DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            request.setAttribute("leaders", rs);

            request.getRequestDispatcher(
                    "/leaderboard.jsp"
            ).forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            throw new ServletException(
                    "Unable to load leaderboard", e);
        }
    }
}
