package Dao;

import java.sql.*;

public class ConnDB {
    // Get database connection info from environment variables (Docker)
    private static final String DB_HOST = System.getenv("MYSQL_HOST") != null ?
            System.getenv("MYSQL_HOST") : "mysql";
    private static final String DB_PORT = System.getenv("MYSQL_PORT") != null ?
            System.getenv("MYSQL_PORT") : "3307";
    private static final String DB_NAME = System.getenv("MYSQL_DATABASE") != null ?
            System.getenv("MYSQL_DATABASE") : "dataweb";
    private static final String DB_USER = System.getenv("MYSQL_USER") != null ?
            System.getenv("MYSQL_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("MYSQL_PASSWORD") != null ?
            System.getenv("MYSQL_PASSWORD") : "Passnhutren1";

    // Build the JDBC URL using the environment values
    private static final String DB_URL = "jdbc:mysql://" + DB_HOST + ":" + DB_PORT + "/" + DB_NAME;

    public Connection conn;

    public Connection getConn() {
        try {
            if (conn == null || conn.isClosed()) {
                // Open a new connection if closed
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public ConnDB() {
        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connected to the database successfully: " + DB_URL);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Database connection failed: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ConnDB s = new ConnDB();
    }
}
