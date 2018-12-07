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

    public static ShopBean getServicesByShop(String shopName) {
        return ShopDAO.getServicesByShop(shopName);
    }

    public static List<ShopBean> getShop(String petsType, String serviceType) {
        return ShopDAO.getShop(petsType, serviceType);
    }
}
