package bean;

public class ShopBean {
    private String shopname;
    private String password;
    private String address = null;

    public ShopBean(String shopname, String password) {
        this.shopname = shopname;
        this.password = password;
    }

    public String getShopname() {
        return shopname;
    }

    public String getPassword() {
        return password;
    }

    public String getAddress() {
        return address;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
