package service;

import tools.SHA;
import dao.ShopDAO;

public class ShopService {

    /**
     *
     * @param name name from servlet
     * @param password password from servlet
     * @return whether login successful
     */
    public static boolean loginCheck(String name, String password) {
        if (name == null || password == null) return false;
        SHA transfer = new SHA();
        String passwordHash = transfer.SHA256(password);
        return ShopDAO.login(name, passwordHash);
    }
}
