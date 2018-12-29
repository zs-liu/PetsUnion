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
     * @param owner owner from servlet
     * @return whether register successful
     */
    public static int registerCheck(OwnerBean owner) {
        if (owner.getOwnerName() == null || owner.getOwnerPw() == null) return LoginRegisterPara.invalid;
        owner.setOwnerPw(SHA.SHA256(owner.getOwnerPw()));
        return OwnerDAO.register(owner);
    }
}
