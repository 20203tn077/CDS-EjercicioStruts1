package mx.edu.utez.proyectostruts2.service;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;

public class MySQLConnection {
    private static final Logger logger = LogManager.getLogger(MySQLConnection.class);

    public static Connection getConnection() throws SQLException {
        String host = "127.0.0.1";
        String port = "3306";
        String database = "cubase";
        String useSSL = "false";
        String timezone = "UTC";
        String url = String.format("jdbc:mysql://%s:%s/%s?useSSL=%s&serverTimezone=%s", host, port, database, useSSL, timezone);
        DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
        return DriverManager.getConnection(url, "root", "root");
    }

    public static void closeConnection(Connection con, PreparedStatement pstm, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }

            if (pstm != null) {
                pstm.close();
            }

            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            logger.error("Error al cerrar las conexiones.");
        }
    }

    public static void closeConnection(Connection con, PreparedStatement pstm) {
        try {
            if (pstm != null) {
                pstm.close();
            }

            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            logger.error("Error al cerrar las conexiones.");
        }
    }

    public static void main(String[] args) {
        try {
            Connection con = MySQLConnection.getConnection();
            System.out.println("Ok");
            con.close();
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
    }
}
