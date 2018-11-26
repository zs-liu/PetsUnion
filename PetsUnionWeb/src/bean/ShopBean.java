package bean;

public class ShopBean {
    private String shopName;
    private String ownerId;
    private String instruction;
    private String shopImgUrl;
    private String address;
    private String shopHours;
    private String shopTel;
    private int grades;

    public ShopBean(String shopname) {
        this.shopName = shopname;
    }

    public String getShopname() {
        return shopName;
    }

    public String getAddress() {
        return address;
    }

    public void setShopname(String shopName) {
        this.shopName = shopName;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
