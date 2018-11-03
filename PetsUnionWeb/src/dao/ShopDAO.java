package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ShopBean;
import db.DBUtils;

public class ShopDAO {

    public static boolean login(String name, String passwordHash) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT name, password FROM shops WHERE name=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            result = pstmt.executeQuery();

            if (result.next()) {
                if (passwordHash.equals(result.getString("password"))) {
                    return true;
                }
            }

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        return false;
    }

    public static boolean register(String name, String passwordHash) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;
        ShopBean shop = null;

        String sqlSelect = "SELECT name FROM shops WHERE name=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sqlSelect);
            pstmt.setString(1, name);
            result = pstmt.executeQuery();

            if (result.next()) return false;

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        String sqlInsert = "INSERT INTO shops (name, password) VALUES(?,?)";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, name);
            pstmt.setString(2, passwordHash);
            pstmt.executeUpdate();

        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return false;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        return true;
    }
}
