package dao;

import db.DBUtils;
import tools.StaticPara;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OwnerDAO {

    /**
     * check whether the user exists (can login)
     *
     * @param id           "user id"
     * @param passwordHash "sha256 on password"
     * @return whether login successful
     */
    public static int login(String id, String passwordHash) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql ="SELECT userId, userpw FROM petsowner WHERE userId=?";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            result = pstmt.executeQuery();

            if (result.next()) {
                if (passwordHash.equals(result.getString("userpw"))) {
                    return StaticPara.LoginRegisterPara.success;
                }
            } else {
                return StaticPara.LoginRegisterPara.loginWrongPassword;
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.LoginRegisterPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return StaticPara.LoginRegisterPara.unknown;
    }

    public static int register(String id, String name, String passwordHash, String tel) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sqlInsert = "INSERT INTO petsowner(userId,userPw,userName,userTel) VALUES(?,?,?,?);";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, id);
            pstmt.setString(2, passwordHash);
            pstmt.setString(3, name);
            pstmt.setString(4, tel);
            pstmt.executeUpdate();

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.LoginRegisterPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return StaticPara.LoginRegisterPara.success;
    }

}
