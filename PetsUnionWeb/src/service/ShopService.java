package service;

import tools.SHA;
import dao.ShopDAO;
import tools.StaticPara;

public class ShopService {

    /**
     * @param name     name from servlet
     * @param password password from servlet
     * @return whether login successful
     */
    public static int loginCheck(String name, String password) {
        if (name == null || password == null) return StaticPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.login(name, passwordHash);
    }

    /**
     * @param name     name from servlet
     * @param password password from servlet
     * @return whether register successful
     */
    public static int registerCheck(String name, String password) {
        if (name == null || password == null) return StaticPara.invalid;
        String passwordHash = SHA.SHA256(password);
        return ShopDAO.register(name, passwordHash);
    }
}
