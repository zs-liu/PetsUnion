package bean;

public class ServiceBean {
    private int shop;
    private int petCategory;
    private int serviceCategory;
    private int startTime;
    private int endTime;

    public ServiceBean(int shop, int petCategory, int serviceCategory,
                       int startTime, int endTime) {
        this.shop = shop;
        this.petCategory = petCategory;
        this.serviceCategory = serviceCategory;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    public ServiceBean(int shop, int startTime, int endTime) {
        this.shop = shop;
        this.startTime = startTime;
        this.endTime = endTime;
    }
}
