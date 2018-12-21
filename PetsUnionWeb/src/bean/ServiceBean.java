package bean;

import org.json.JSONObject;

public class ServiceBean {
    private String shopName;
    private String petsType;
    private String serviceType;
    private String serviceIntro;
    private String price;

    public ServiceBean(String shopName,
                       String petsType,
                       String serviceType,
                       String serviceIntro,
                       String price) {
        this.shopName = shopName;
        this.petsType = petsType;
        this.serviceType = serviceType;
        this.serviceIntro = serviceIntro;
        this.price = price;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public void setPetsType(String petsType) {
        this.petsType = petsType;
    }

    public void setServiceType(String serviceType) {
        this.serviceType = serviceType;
    }

    public void setServiceIntro(String serviceIntro) {
        this.serviceIntro = serviceIntro;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getShopName() {
        return shopName;
    }

    public String getPetsType() {
        return petsType;
    }

    public String getServiceType() {
        return serviceType;
    }

    public String getServiceIntro() {
        return serviceIntro;
    }

    public String getPrice() {
        return price;
    }

    public JSONObject toJSON() {
        JSONObject serviceJson = new JSONObject();
        serviceJson.put("shopName", this.shopName);
        serviceJson.put("petsType", this.petsType);
        serviceJson.put("serviceType", this.serviceType);
        serviceJson.put("serviceIntro", this.serviceIntro);
        serviceJson.put("price", this.price);
        return serviceJson;
    }
}
