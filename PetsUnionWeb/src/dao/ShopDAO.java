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
                if (passwordHash.equals(result.getString("ownerpw"))) {
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

        String sqlInsert = "INSERT INTO shopowner(ownerId,ownerPw,ownerName,ownerTel) VALUES(?,?,?,?);";

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

    /**
     * update services of a certain shop, given certain service information
     *
     * @param shopName     the ID of shop
     * @param serviceIntro the introduction of service
     * @param serviceType  the service type
     * @param petsType     the pet type of service
     * @param price        the service price
     * @return
     */
    public static int updateServiceByShop(String shopName, String serviceIntro, String serviceType,
                                          String petsType, String price) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "INSERT INTO shopservice(shopName,serviceIntro,serviceType,petsType,price) VALUES(?,?,?,?,?);";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            pstmt.setString(2, serviceIntro);
            pstmt.setString(3, serviceType);
            pstmt.setString(4, petsType);
            pstmt.setString(5, price);
            pstmt.executeUpdate();

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.SqlPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return StaticPara.SqlPara.success;
    }


    public static int updateInfoByShop(String shopName, String instruction, String shopImgUrl,
                                       String address, String shopHours, String shopTel) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "UPDATE petsshop SET instruction=?,shopImgUrl=?,address=?,shopHours=?,shopTel=? WHERE shopName=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, instruction);
            pstmt.setString(2, shopImgUrl);
            pstmt.setString(3, address);
            pstmt.setString(4, shopHours);
            pstmt.setString(5, shopTel);
            pstmt.setString(6, shopName);
            pstmt.executeUpdate();

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            return StaticPara.SqlPara.sqlError;
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return StaticPara.SqlPara.success;
    }

    /**
     * get services provided by a certain shop, on a certain pet type and a certain service type
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

    /**
     * get services provided by a certain shop
     *
     * @param shopName the ID of shop
     * @return a shop bean object
     */
    public static ShopBean getServicesByShop(String shopName) {
        List<ServiceBean> servicesList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        ShopBean shopBean = null;

        String sql1 = "SELECT * FROM petshop WHERE shopName=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, shopName);
            result = pstmt.executeQuery();

            shopBean = new ShopBean(result.getString("shopName"));
            shopBean.setOwnerId(result.getString("ownerId"));
            shopBean.setInstruction(result.getString("instruction"));
            shopBean.setShopImgUrl(result.getString("shopImgUrl"));
            shopBean.setAddress(result.getString("address"));
            shopBean.setShopHours(result.getString("shopHours"));
            shopBean.setShopTel(result.getString("shopTel"));
            shopBean.setGrades(result.getInt("grades"));

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        String sql2 = "SELECT serviceIntro, price FROM shopservice WHERE shopName=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql2);
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

        if (shopBean != null) shopBean.setServiceList(servicesList);

        return shopBean;
    }

    /**
     * get shops provides certain service
     *
     * @param petsType    the pet type of service
     * @param serviceType the service type
     * @return the list of shop
     */
    public static List<ShopBean> getShop(String petsType, String serviceType) {
        List<ShopBean> shopList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        String sql = "SELECT a.shopname,a.instruction, a.address,a.shopTel, a.shopImgUrl " +
                "FROM petsshop a, shopservice b " +
                "WHERE a.shopname = b.shopname AND b.petstype=? AND b.servicetype=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, petsType);
            pstmt.setString(2, serviceType);
            result = pstmt.executeQuery();

            while (result.next()) {
                ShopBean shop = new ShopBean(result.getString("shopName"));
                shop.setInstruction(result.getString("instruction"));
                shop.setAddress(result.getString("address"));
                shop.setShopTel("shopTel");
                shop.setShopImgUrl("shopImgUrl");
                shopList.add(shop);
            }
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }
        return shopList;
    }
}
