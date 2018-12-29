package bean;

import org.json.JSONObject;

public class OwnerBean {
    private String ownerId;
    private String ownerPw;
    private String ownerName;
    private String ownerTel;
    private String shopName;

    public OwnerBean(String ownerId) {
        this.ownerId = ownerId;
    }

    public void setOwnerPw(String ownerPw){
        this.ownerPw = ownerPw;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public void setOwnerTel(String ownerTel) {
        this.ownerTel = ownerTel;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public String getOwnerId() {
        return this.ownerId;
    }

    public String getOwnerPw() {
        return this.ownerPw;
    }

    public String getOwnerName() {
        return this.ownerName;
    }

    public String getOwnerTel() {
        return this.ownerTel;
    }

    public String getShopName() {
        return this.shopName;
    }

    public JSONObject toJSON() {
        JSONObject ownerJson = new JSONObject();
        ownerJson.put("ownerId", this.ownerId);
        ownerJson.put("ownerName", this.ownerName);
        ownerJson.put("ownerTel", this.ownerTel);
        ownerJson.put("shopName", this.shopName);
        return ownerJson;
    }
}
