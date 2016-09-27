package model;

/**
 * Created by daddywolf on 16/6/19.
 */
public class OrderTempAddress {
    private String receiver;
    private String mobile;
    private String dormitoryBd;
    private String dormitoryRm;

    public String getDormitoryRm() {
        return dormitoryRm;
    }

    public void setDormitoryRm(String dormitoryRm) {
        this.dormitoryRm = dormitoryRm;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getDormitoryBd() {
        return dormitoryBd;
    }

    public void setDormitoryBd(String dormitoryBd) {
        this.dormitoryBd = dormitoryBd;
    }

}
