
package com.codequest;

import java.sql.Connection;
import java.sql.DriverManager;

public final class DBConnection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/codequest_db?useSSL=false&serverTimezone=Asia/Kolkata";

    private static final String USER = "root";

    private static final String PASSWORD = "Aswini@0923";

    private DBConnection() {
    }

    public static Connection getConnection() {

        try {

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("MySQL Driver Loaded Successfully!");

            // Establish Database Connection
            Connection con = DriverManager.getConnection(
                URL,
                USER,
                PASSWORD
            );

            System.out.println("Database Connected Successfully!");

            return con;

        } catch (Exception e) {

            throw new RuntimeException(
                "Database Connection Failed: " + e.getMessage(), e
            );
        }
    }

    public static void main(String[] args) {

        try {
            Connection con = getConnection();

            System.out.println("Connection Test Successful!");

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
