package service;

import bean.ReservationBean;
import dao.ReservationDAO;
import tools.StaticPara.ReservationStatusPara;
import tools.StaticPara.SqlPara;

import java.util.List;

public class ReservationService {

    /**
     * @param shopName "shop name"
     * @param status   "reservation status"
     * @return the list of reservation
     */
    public static List<ReservationBean> searchForShop(String shopName, int status) {
        return ReservationDAO.searchForShop(shopName, status);
    }

    /**
     * @param userId "user Id"
     * @param status "reservation status"
     * @return the list of reservation
     */
    public static List<ReservationBean> searchForUser(String userId, int status) {
        return ReservationDAO.searchForUser(userId, status);
    }

    /**
     * @param shopName     the shop name of reservation
     * @param userId       the user id of reservation
     * @param petsOwnerTel the pet's owner telephone of reservation
     * @param petsType     the pet type of reservation
     * @param serviceType  the service type of reservation
     * @param serBeginTime the begin time of reservation
     * @param serEndTime   the end time of reservation
     * @param comment      the comment of reservation
     * @return whether insert success
     */
    public static int insert(String shopName, String userId, String petsOwnerTel, String petsType, String serviceType,
                             String serBeginTime, String serEndTime, String comment) {
        if (shopName.equals("") || userId.equals("") || petsType.equals("")) {
            return SqlPara.invalid;
        } else {
            return ReservationDAO.insert(shopName, userId, petsOwnerTel, petsType, serviceType,
                    ReservationStatusPara.toDo, serBeginTime, serEndTime, comment);
        }
    }

    /**
     * @param orderId the order id of reservation
     * @param status  the status of reservation
     * @return whether update success
     */
    public static int update(int orderId, int status) {
        return ReservationDAO.update(orderId, status);
    }
}
