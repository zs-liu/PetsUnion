package service;

import bean.ReservationBean;
import dao.ReservationDAO;
import tools.StaticPara.ReservationStatusPara;
import tools.StaticPara.SqlPara;

import java.util.List;

public class ReservationService {
    public static List<ReservationBean> searchForShop(String shopName, int status) {
        return ReservationDAO.searchForShop(shopName, status);
    }

    public static List<ReservationBean> searchForUser(String userId, int status) {
        return ReservationDAO.searchForUser(userId, status);
    }

    public static int insert(String shopName, String userId, String petsOwnerTel, String petsType, String serviceType,
                             String serBeginTime, String serEndTime, String comment) {
        if (shopName == null || userId == null || petsType == null) {
            return SqlPara.invalid;
        } else {
            return ReservationDAO.insert(shopName, userId, petsOwnerTel, petsType, serviceType,
                    ReservationStatusPara.toDo, serBeginTime, serEndTime, comment);
        }
    }

    public static int update(int orderId, int status) {
        return ReservationDAO.update(orderId, status);
    }
}
