package service;

import bean.ReservationBean;
import dao.ReservationDAO;

import java.util.List;

public class ReservationService {
    public static List<ReservationBean> searchForShop(String shopName, int status) {
        return ReservationDAO.searchForShop(shopName, status);
    }

    public static List<ReservationBean> searchForUser(String userId, int status) {
        return ReservationDAO.searchForUser(userId, status);
    }
}
