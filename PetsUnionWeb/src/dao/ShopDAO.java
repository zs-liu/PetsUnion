package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.ServiceBean;
import bean.ShopBean;
import db.DBUtils;
import tools.StaticPara;

public class ShopDAO {

    /**
     * check whether the shop exists (can login)
     *
     * @param id           "shop id"
     * @param passwordHash "sha256 on password"
     * @return whether login successful
     */
    public static int login(String id, String passwordHash) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT ownerid, ownerpw FROM shopowner WHERE ownerid=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            result = pstmt.executeQuery();

            if (result.next()) {
                if (passwordHash.equals(result.getString("password"))) {
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

    /**
     * write the new shop into database
     *
     * @param id           "shop id"
     * @param name         "shop name"
     * @param passwordHash "sha256 on password"
     * @param tel          "shop telephone"
     * @return whether the register is successful
     */

    public static int register(String id, String name, String passwordHash, String tel) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sqlInsert = "INSERT INTO shopowner(ownerid,ownerpw,ownername,ownertel) VALUES(?,?,?,?);";

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


    /*
    /**
     * @param petCategory     the category of pet(valid)
     * @param serviceCategory the category of service(valid)
     * @param startTime       the willing start time of service(valid)
     * @param endTime         the willing end time of service(valid)
     * @param pageNo          the page number of results
     * @param numPerPage      the number of results in per page
     * @return the list of service
     */
    /*
    public static List<ServiceBean> getServicesAtPage(int petCategory, int serviceCategory, int startTime, int endTime,
                                                       int pageNo, int numPerPage) {
        List<ServiceBean> servicesList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT shop,start_time,end_time FROM services " +
                "WHERE pet_category=? AND service_category=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startTime);
            pstmt.setInt(2, endTime);
            result = pstmt.executeQuery();

            while (result.next()) {
                servicesList.add(new ServiceBean(result.getInt("shop"),
                        result.getInt("start_time"),
                        result.getInt("end_time")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        return servicesList;
    }*/


    /**
     * get services provided by a certain shop
     *
     * @param shopName    the ID of shop
     * @param petsType    the category of pet
     * @param serviceType the category of service
     * @return the list of service
     */
    public static List<ServiceBean> getServicesByShop(String shopName, String petsType, String serviceType) {

        List<ServiceBean> servicesList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT serviceIntro, price FROM shopservice " +
                "WHERE shopName=? AND petsType = ? AND serviceType=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            pstmt.setString(2, petsType);
            pstmt.setString(3, serviceType);
            result = pstmt.executeQuery();

            while (result.next()) {
                servicesList.add(new ServiceBean(shopName, petsType, serviceType,
                        result.getString("serviceIntro"), result.getString("price")));
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        return servicesList;
    }

    public static List<ServiceBean> getServicesByShop(String shopName) {
        List<ServiceBean> servicesList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;


        String sql = "SELECT serviceIntro, price FROM shopservice WHERE shopName=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            result = pstmt.executeQuery();

            while (result.next()) {
                servicesList.add(new ServiceBean(shopName,
                        result.getString("petsType"), result.getString("serviceType"),
                        result.getString("serviceIntro"), result.getString("price")));
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return servicesList;
    }
}
