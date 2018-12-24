package service;

import dao.OwnerDAO;
import bean.OwnerBean;
import tools.StaticPara.LoginRegisterPara;
import tools.SHA;

public class OwnerService {

    /**
     * @param owner owner from servlet
     * @return whether login successful
     */
    public static int loginCheck(OwnerBean owner) {
        if (owner.getOwnerId() == null || owner.getOwnerPw() == null) return LoginRegisterPara.invalid;
        owner.setOwnerPw(SHA.SHA256(owner.getOwnerPw())); 
        return OwnerDAO.login(owner);
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
        return OwnerDAO.register(id, name, passwordHash, tel);
    }
}
