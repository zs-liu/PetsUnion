package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtils {

    public static Connection getConn() {

        String url = "jdbc:mysql://localhost:3306/demo?useUnicode=true&characterEncoding=UTF-8&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

        String username = "root";
        String password = "123456"; // use your configuration

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void closeAll(ResultSet result, Statement stmt, Connection conn) {
        try {
            if (result != null)
                result.close();
            if (stmt != null)
                stmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
