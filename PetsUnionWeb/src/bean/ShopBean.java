package bean;

public class ShopBean {
    private String shopname;
    private String password;

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

    public void setShopname(String shopname) {
        this.shopname = shopname;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
