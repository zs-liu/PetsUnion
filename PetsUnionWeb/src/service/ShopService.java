package service;

import java.util.List;

import tools.SHA;
import tools.StaticPara.LoginRegisterPara;
import dao.ShopDAO;
import bean.ServiceBean;
import bean.OwnerBean;
import bean.ShopBean;

public class ShopService {

    /**
     * @param owner owner from servlet
     * @return whether login successful
     */
    public static int loginCheck(OwnerBean owner) {
        if (owner.getOwnerId().equals("") || owner.getOwnerPw().equals("")) return LoginRegisterPara.invalid;
        owner.setOwnerPw(SHA.SHA256(owner.getOwnerPw()));
        return ShopDAO.login(owner);
    }

    /**
     * @param owner owner from servlet
     * @param shop  shop from servlet
     * @return whether register successful
     */
    public static int registerCheck(OwnerBean owner, ShopBean shop) {
        if (owner.getOwnerName().equals("") || owner.getOwnerPw().equals("")
                || shop.getShopName().equals("") || shop.getAddress().equals("")) return LoginRegisterPara.invalid;
        owner.setOwnerPw(SHA.SHA256(owner.getOwnerPw()));
        if (shop.getShopImgUrl() == null || shop.getShopImgUrl().equals("")) {
            int number = (int) (1 + Math.random() * (9));
            shop.setShopImgUrl("images/portrait/portrait" + number + ".png");
        }
        return ShopDAO.register(owner, shop);
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
    public static List<ShopBean> getShop(String petsType, String serviceType, int pageNumber, int perPage) {
        return ShopDAO.getShop(petsType, serviceType, pageNumber, perPage);
    }

    /**
     * @param shopName     the ID of shop
     * @param serviceIntro the introduction of service
     * @param serviceType  the type of service
     * @param petsType     the type of pet
     * @param price        the price of service
     * @return whether insert service successful
     */
    public static int updateServiceByShop(String shopName, String serviceIntro, String serviceType,
                                          String petsType, String price) {
        return ShopDAO.updateServiceByShop(shopName, serviceIntro, serviceType, petsType, price);
    }

    /**
     * @param shopName     the ID of shop
     * @param serviceIntro the introduction of service
     * @param serviceType  the type of service
     * @param petsType     the type of pet
     * @param price        the price of service
     * @return whether delete service successful
     */
    public static int deleteServiceByShop(String shopName, String serviceIntro, String serviceType,
                                          String petsType, String price) {
        return ShopDAO.deleteServiceByShop(shopName, serviceIntro, serviceType, petsType, price);
    }

    /**
     * @param shopName    the ID of shop
     * @param instruction the instruction of shop
     * @param shopImgUrl  the url of the image of shop
     * @param address     the address of shop
     * @param shopHours   the shop hours
     * @param shopTel     the telephone of shop
     * @return whether update information successful
     */
    public static int updateInfoByShop(String shopName, String instruction, String shopImgUrl,
                                       String address, String shopHours, String shopTel) {
        return ShopDAO.updateInfoByShop(shopName, instruction, shopImgUrl, address, shopHours, shopTel);
    }
}
