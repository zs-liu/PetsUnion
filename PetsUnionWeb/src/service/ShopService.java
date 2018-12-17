package service;

import java.util.List;

import bean.ShopBean;
import tools.SHA;
import tools.StaticPara.LoginRegisterPara;
import dao.ShopDAO;
import bean.ServiceBean;

public class ShopService {

    /**
     * @param id       id from servlet
     * @param password password from servlet
     * @return whether login successful
     */
    public static int loginCheck(String id, String password) {
        if (id == null || password == null) return LoginRegisterPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.login(id, passwordHash);
    }

    /**
     * @param id       id from servlet
     * @param name     name from servlet
     * @param password password from servlet
     * @param tel      telephone from servlet
     * @return whether register successful
     */
    public static int registerCheck(String id, String name, String password, String tel) {
        if (name == null || password == null) return LoginRegisterPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.register(id, name, passwordHash, tel);
    }

    /**
     * @param shopName    the ID of shop
     * @param petsType    the category of pet
     * @param serviceType the category of service
     * @return the list of service
     */
    public static List<ServiceBean> getServicesByShop(String shopName, String petsType, String serviceType) {
        return ShopDAO.getServicesByShop(shopName, petsType, serviceType);
    }

    /**
     * @param shopName the ID of shop
     * @return the shop object
     */
    public static ShopBean getServicesByShop(String shopName) {
        return ShopDAO.getServicesByShop(shopName);
    }

    /**
     * @param petsType    the type of pet
     * @param serviceType the typeof service
     * @return the list of service
     */
    public static List<ShopBean> getShop(String petsType, String serviceType) {
        return ShopDAO.getShop(petsType, serviceType);
    }

    /**
     * @param shopName the ID of shop
     * @param serviceIntro the introduction of service
     * @param serviceType the type of service
     * @param petsType the type of pet
     * @param price the price of service
     * @return whether update seccessful
     */
    public static int updateServiceByShop(String shopName, String serviceIntro, String serviceType,
                                          String petsType, String price) {
        return ShopDAO.updateServiceByShop(shopName, serviceIntro, serviceType, petsType, price);
    }

    public static int updateInfoByShop(String shopName, String instruction, String shopImgUrl,
                                       String address, String shopHours, String shopTel) {
        return ShopDAO.updateInfoByShop(shopName, instruction, shopImgUrl, address, shopHours, shopTel);
    }
}
