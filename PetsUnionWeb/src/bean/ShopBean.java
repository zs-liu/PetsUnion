package bean;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.List;

public class ShopBean {
    private String shopName;
    private String ownerId;
    private String instruction;
    private String shopImgUrl;
    private String address;
    private String shopHours;
    private String shopTel;
    private int grades;
    private List<ServiceBean> serviceList;

    public ShopBean(String shopName) {
        this.shopName = shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public void setInstruction(String instruction) {
        this.instruction = instruction;
    }

    public void setShopImgUrl(String shopImgUrl) {
        this.shopImgUrl = shopImgUrl;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setShopHours(String shopHours) {
        this.shopHours = shopHours;
    }

    public void setShopTel(String shopTel) {
        this.shopTel = shopTel;
    }

    public void setGrades(int grades) {
        this.grades = grades;
    }

    public void setServiceList(List<ServiceBean> serviceList) {
        this.serviceList = serviceList;
    }

    public String getShopName() {
        return shopName;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public String getInstruction() {
        return instruction;
    }

    public String getShopImgUrl() {
        return shopImgUrl;
    }

    public String getAddress() {
        return address;
    }

    public String getShopHours() {
        return shopHours;
    }

    public String getShopTel() {
        return shopTel;
    }

    public List<ServiceBean> getServiceList() {
        return serviceList;
    }

    public int getGrades() {
        return grades;
    }

    public JSONObject toJSON() {
        JSONObject shopJson = new JSONObject();
        shopJson.put("shopName", this.shopName);
        shopJson.put("ownerId", this.ownerId);
        shopJson.put("instruction", this.instruction);
        shopJson.put("shopImgUrl", this.shopImgUrl);
        shopJson.put("address", this.address);
        shopJson.put("shopHours", this.shopHours);
        shopJson.put("shopTel", this.shopTel);
        shopJson.put("grades", this.grades);

        JSONArray serviceJsonList = new JSONArray();
        for (ServiceBean service : this.serviceList) {
            serviceJsonList.put(service.toJSON());
        }
        shopJson.put("service", serviceJsonList);
        return shopJson;
    }
}
