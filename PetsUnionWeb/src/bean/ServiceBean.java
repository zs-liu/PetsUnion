package bean;

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
}
