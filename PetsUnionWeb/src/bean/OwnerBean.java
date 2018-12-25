package bean;

import org.json.JSONObject;

public class OwnerBean {
    private String ownerId;
    private String ownerPw;
    private String ownerName;
    private String ownerTel;

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

    public JSONObject toJSON() {
        JSONObject ownerJson = new JSONObject();
        ownerJson.put("ownerId", this.ownerId);
        ownerJson.put("ownerName", this.ownerName);
        ownerJson.put("ownerTel", this.ownerTel);
        return ownerJson;
    }
}
