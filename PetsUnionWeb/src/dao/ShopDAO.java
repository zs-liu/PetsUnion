package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.OwnerBean;
import bean.ServiceBean;
import bean.ShopBean;
import db.DBUtils;
import tools.StaticPara;

public class ShopDAO {

    /**
     * check whether the shop exists (can login)
     *
     * @param owner the owner
     * @return whether login successful
     */
    public static int login(OwnerBean owner) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        //language=MySQL
        String sql = "SELECT ownerid, ownerpw FROM shopowner WHERE ownerid=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, owner.getOwnerId());
            result = pstmt.executeQuery();

            if (result.next()) {
                if (owner.getOwnerPw().equals(result.getString("ownerpw"))) {
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
     * @param owner shop owner
     * @param shop  the shop
     * @return whether the register is successful
     */
    public static int register(OwnerBean owner, ShopBean shop) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        //language=MySQL
        String sql1 = "INSERT INTO shopowner(ownerId,ownerPw,ownerName,ownerTel) VALUES(?,?,?,?);";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql1);
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

        //language=MySQL
        String sql2 = "INSERT INTO petsshop(shopName, ownerId, address, shopImgUrl) VALUES(?,?,?,?);";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, shop.getShopName());
            pstmt.setString(2, shop.getOwnerId());
            pstmt.setString(3, shop.getAddress());
            pstmt.setString(4, shop.getShopImgUrl());
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

        //language=MySQL
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

    public static int deleteServiceByShop(String shopName, String serviceIntro, String serviceType,
                                          String petsType, String price) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        //language=MySQL
        String sql = "DELETE FROM shopservice WHERE shopName=? AND serviceType=? AND petsType=?;";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, shopName);
            pstmt.setString(2, serviceType);
            pstmt.setString(3, petsType);
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

        //language=MySQL
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

        //language=MySQL
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

        //language=MySQL
        String sql1 = "SELECT * FROM petsshop WHERE shopName=?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql1);
            pstmt.setString(1, shopName);
            result = pstmt.executeQuery();

            if (result.next()) {
                shopBean = new ShopBean(result.getString("shopName"));
                shopBean.setOwnerId(result.getString("ownerId"));
                shopBean.setInstruction(result.getString("instruction"));
                shopBean.setShopImgUrl(result.getString("shopImgUrl"));
                shopBean.setAddress(result.getString("address"));
                shopBean.setShopHours(result.getString("shopHours"));
                shopBean.setShopTel(result.getString("shopTel"));
                shopBean.setGrades(result.getInt("grades"));
            }

        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
        } finally {
            DBUtils.closeAll(result, pstmt, conn);
        }

        //language=MySQL
        String sql2 = "SELECT * FROM shopservice WHERE shopName=?";

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
    public static List<ShopBean> getShop(String petsType, String serviceType, int pageNumber, int perPage) {
        List<ShopBean> shopList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet result = null;

        //language=MySQL
        String sql = "SELECT a.shopname,a.instruction, a.address,a.shopTel, a.shopImgUrl " +
                "FROM petsshop a, shopservice b " +
                "WHERE a.shopname = b.shopname AND b.petstype=? AND b.servicetype=?" +
                "LIMIT ?,?";

        try {
            conn = DBUtils.getConn();

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, petsType);
            pstmt.setString(2, serviceType);
            pstmt.setInt(3, (pageNumber - 1) * perPage);
            pstmt.setInt(4, perPage);
            result = pstmt.executeQuery();

            while (result.next()) {
                ShopBean shop = new ShopBean(result.getString("shopName"));
                shop.setInstruction(result.getString("instruction"));
                shop.setAddress(result.getString("address"));
                shop.setShopTel(result.getString("shopTel"));
                shop.setShopImgUrl(result.getString("shopImgUrl"));
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
