
package com.codequest.servlet;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

@WebServlet("/view-questions")
public class ViewQuestionsServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("adminId") == null) {

            response.sendRedirect("admin-login.jsp");
            return;
        }

        String sql =
            "SELECT id, title, category, difficulty, xp_reward " +
            "FROM missions ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            CachedRowSet rows =
                    RowSetProvider.newFactory().createCachedRowSet();

            rows.populate(rs);

            request.setAttribute("questions", rows);

            request.getRequestDispatcher(
                    "/view-questions.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load questions", e);
        }
    }
}
