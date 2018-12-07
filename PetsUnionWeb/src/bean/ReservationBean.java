package bean;

import org.json.JSONObject;

public class ReservationBean {
    private int orderId;
    private String shopName;
    private String userId;
    private String petsOwnerTel;
    private String petsType;
    private String serviceType;
    private int status;
    private String serBeginTime;
    private String serEndTime;
    private String comment;

    public ReservationBean(int orderId) {
        this.orderId = orderId;
    }

    public ReservationBean(int orderId, String shopName, String userId, String petsOwnerTel, String petsType,
                           String serviceType, int status, String serBeginTime, String serEndTime, String comment) {
        this.orderId = orderId;
        this.shopName = shopName;
        this.userId = userId;
        this.petsOwnerTel = petsOwnerTel;
        this.petsType = petsType;
        this.serviceType = serviceType;
        this.status = status;
        this.serBeginTime = serBeginTime;
        this.serEndTime = serEndTime;
        this.comment = comment;
    }

    public JSONObject toJSON() {
        JSONObject reservationJson = new JSONObject();
        reservationJson.put("orderId", this.orderId);
        reservationJson.put("shopName", this.shopName);
        reservationJson.put("userId", this.userId);
        reservationJson.put("petsOwnerTel", this.petsOwnerTel);
        reservationJson.put("petsType", this.petsType);
        reservationJson.put("serviceType", this.serviceType);
        reservationJson.put("status", this.status);
        reservationJson.put("serBeginTime", this.serBeginTime);
        reservationJson.put("serEndTime", this.serEndTime);
        reservationJson.put("comment", this.comment);
        return reservationJson;
    }
}
