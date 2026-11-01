
package com.codequest.servlet;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/delete-question")
public class DeleteQuestionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        try {
            int questionId = Integer.parseInt(
                    request.getParameter("id"));

            try (Connection con = DBConnection.getConnection()) {

                // Check whether students already attempted this question
                String checkSql =
                        "SELECT COUNT(*) FROM mission_submissions "
                      + "WHERE mission_id = ?";

                try (PreparedStatement check =
                        con.prepareStatement(checkSql)) {

                    check.setInt(1, questionId);

                    try (ResultSet rs = check.executeQuery()) {
                        rs.next();

                        if (rs.getInt(1) > 0) {
                            response.sendRedirect(
                                request.getContextPath()
                                + "/view-questions?error=attempted");
                            return;
                        }
                    }
                }

                // Delete question only if no attempts exist
                String deleteSql =
                        "DELETE FROM missions WHERE id = ?";

                try (PreparedStatement ps =
                        con.prepareStatement(deleteSql)) {

                    ps.setInt(1, questionId);

                    int deleted = ps.executeUpdate();

                    if (deleted > 0) {
                        response.sendRedirect(
                            request.getContextPath()
                            + "/view-questions?deleted=1");
                    } else {
                        response.sendRedirect(
                            request.getContextPath()
                            + "/view-questions?error=notfound");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();

            throw new ServletException(
                    "Unable to delete question.", e);
        }
    }
}
