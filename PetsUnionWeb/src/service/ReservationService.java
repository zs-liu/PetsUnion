package service;

import bean.ReservationBean;
import dao.ReservationDAO;

import java.util.List;

public class ReservationService {
    public static List<ReservationBean> searchForShop(String id, int status) {
        return ReservationDAO.searchForShop(id, status);
    }
}
