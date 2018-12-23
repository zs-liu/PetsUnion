package bean;

import org.json.JSONArray;
import org.json.JSONObject;

public class OwnerBean {
    private String userId;
    private String userPw;
    private String userName;
    private String userTel;

    public OwnerBean(String userId) {
        this.userId = userId;
    }

    public void setUserPw(String userPw){
        this.userPw = userPw;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public JSONObject toJSON() {
        JSONObject userJson = new JSONObject();
        userJson.put("userId", this.userId);
        userJson.put("userName", this.userName);
        userJson.put("userTel", this.userTel);
        return userJson;
    }
}
