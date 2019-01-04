package dao;

import db.DBUtils;
import tools.StaticPara;
import bean.OwnerBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OwnerDAO {

    /**
     * check whether the user exists (can login)
     *
     * @param owner login owner
     * @return whether login successful
     */
    public static int login(OwnerBean owner) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String ownerId = owner.getOwnerId();
        String ownerPw = owner.getOwnerPw();

        //language=MySQL
        String sql = "SELECT * FROM petsowner WHERE userId=?";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ownerId);
            result = pstmt.executeQuery();

            if (result.next()) {
                if (ownerPw.equals(result.getString("userPw"))) {
                    owner.setOwnerName(result.getString("userName"));
                    return StaticPara.LoginRegisterPara.success;
                } else {
                    return StaticPara.LoginRegisterPara.loginWrongPassword;
                }
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.LoginRegisterPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return StaticPara.LoginRegisterPara.loginWrongPassword;
    }

    /**
     * register a given owner
     *
     * @param owner register user
     * @return whether register successful
     */
    public static int register(OwnerBean owner) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        //language=MySQL
        String sqlSelect = "SELECT * FROM petsowner WHERE userId=?;";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sqlSelect);
            pstmt.setString(1, owner.getOwnerId());
            result = pstmt.executeQuery();

            if (result.next()) {
                return StaticPara.LoginRegisterPara.registerExistsName;
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.LoginRegisterPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }


        //language=MySQL
        String sqlInsert = "INSERT INTO petsowner(userId,userPw,userName,userTel) VALUES(?,?,?,?);";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sqlInsert);
            pstmt.setString(1, owner.getOwnerId());
            pstmt.setString(2, owner.getOwnerPw());
            pstmt.setString(3, owner.getOwnerName());
            pstmt.setString(4, owner.getOwnerTel());
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
