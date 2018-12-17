package dao;

import db.DBUtils;
import tools.StaticPara;
import bean.ReservationBean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {

    /**
     * search reservation for a shop
     *
     * @param shopName "shop name"
     * @param status   "reservation status"
     * @return the list of reservation
     */
    public static List<ReservationBean> searchForShop(String shopName, int status) {
        List<ReservationBean> reservationList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT * FROM orderform WHERE shopName=? AND status=?";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            pstmt.setInt(2, status);
            result = pstmt.executeQuery();

            while (result.next()) {
                reservationList.add(new ReservationBean(result.getInt("orderId"), shopName,
                        result.getString("userId"), result.getString("petsOwnerTel"),
                        result.getString("petsType"), result.getString("serviceType"),
                        status, result.getString("serBeginTime"),
                        result.getString("serEndTime"), result.getString("comment")));
            }
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return reservationList;
    }

    /**
     * search reservation for a user
     *
     * @param userId "user Id"
     * @param status "reservation status"
     * @return the list of reservation
     */
    public static List<ReservationBean> searchForUser(String userId, int status) {
        List<ReservationBean> reservationList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT * FROM orderform WHERE userId=? AND status=?";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setInt(2, status);
            result = pstmt.executeQuery();

            while (result.next()) {
                reservationList.add(new ReservationBean(result.getInt("orderId"),
                        result.getString("shopName"), userId, result.getString("petsOwnerTel"),
                        result.getString("petsType"), result.getString("serviceType"),
                        status, result.getString("serBeginTime"),
                        result.getString("serEndTime"), result.getString("comment")));
            }
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return reservationList;
    }

    /**
     * insert a reservation
     *
     * @param shopName     the shop name of reservation
     * @param userId       the user id of reservation
     * @param petsOwnerTel the pet's owner telephone of reservation
     * @param petsType     the pet type of reservation
     * @param serviceType  the service type of reservation
     * @param status       the status of reservation (should be to do)
     * @param serBeginTime the begin time of reservation
     * @param serEndTime   the end time of reservation
     * @param comment      the comment of reservation
     * @return whether insert success
     */
    public static int insert(String shopName, String userId, String petsOwnerTel, String petsType, String serviceType,
                             int status, String serBeginTime, String serEndTime, String comment) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "INSERT INTO orderform(shopName,userId,petsOwnerTel,petsType,serviceType," +
                "status,serBeginTime,serEndTime,comment) VALUES(?,?,?,?,?,?,?,?,?);";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            pstmt.setString(2, userId);
            pstmt.setString(3, petsOwnerTel);
            pstmt.setString(4, petsType);
            pstmt.setString(5, serviceType);
            pstmt.setInt(6, status);
            pstmt.setString(7, serBeginTime);
            pstmt.setString(8, serEndTime);
            pstmt.setString(9, comment);

            result = pstmt.executeQuery();
            return StaticPara.SqlPara.success;

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.SqlPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
    }

    /**
     * update reservation status
     *
     * @param orderId the order id of reservation
     * @param status  the status of reservation
     * @return whether update success
     */
    public static int update(int orderId, int status) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "UPDATE orderform SET status=? WHERE orderId=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, status);
            pstmt.setInt(2, orderId);

            result = pstmt.executeQuery();
            return StaticPara.SqlPara.success;

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.SqlPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
    }
}
