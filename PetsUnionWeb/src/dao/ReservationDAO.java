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
     * @param id     "shop id"
     * @param status "reservation status"
     * @return
     */
    public static List<ReservationBean> searchForShop(String id, int status) {
        List<ReservationBean> reservationList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT * FROM orderform WHERE shopName=? AND status=?";
        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setInt(2, status);
            result = pstmt.executeQuery();

            while (result.next()) {
                reservationList.add(new ReservationBean(result.getInt("orderId"), id,
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
}
