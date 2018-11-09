package service;

import java.util.List;

import tools.SHA;
import tools.StaticPara.LoginRegisterPara;
import dao.ShopDAO;
import bean.ServiceBean;

public class ShopService {

    /**
     * @param name     name from servlet
     * @param password password from servlet
     * @return whether login successful
     */
    public static int loginCheck(String name, String password) {
        if (name == null || password == null) return LoginRegisterPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.login(name, passwordHash);
    }

    /**
     * @param name     name from servlet
     * @param password password from servlet
     * @return whether register successful
     */
    public static int registerCheck(String name, String password) {
        if (name == null || password == null) return LoginRegisterPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.register(name, passwordHash);
    }

    /**
     * @param shopID          the ID of shop
     * @param petCategory     the category of pet
     * @param serviceCategory the category of service
     * @return the list of service
     */
    public static List<ServiceBean> getServicesByShop(int shopID, int petCategory, int serviceCategory) {
        return ShopDAO.getServicesByShop(shopID, petCategory, serviceCategory);
    }
}
