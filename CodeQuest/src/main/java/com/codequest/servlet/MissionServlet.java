
package com.codequest.servlet;

import com.codequest.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

@WebServlet("/missions")
public class MissionServlet extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        String sql =
            "SELECT id, title, description, category, difficulty, " +
            "option_a, option_b, option_c, option_d FROM missions";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            CachedRowSet rows =
                    RowSetProvider.newFactory().createCachedRowSet();

            rows.populate(rs);

            request.setAttribute("missions", rows);

            request.getRequestDispatcher(
                    "/missions.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(
                    "Unable to load missions", e);
        }
    }
}
