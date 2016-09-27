package model;

/**
 * Created by 姜志鹏 on 2016/5/9.
 */
public class Courier {
    private int courierid;
    private String mobile;
    private String password;
    private String avatar;
    private String username;
    private int gender;
    private String realName;
    private String idCard;
    private String stuCard;
    private String dormitoryBd;
    private String dormitorRm;
    private String preExpressAdd;
    private String preDormitoryBd;
    private String balance;
    private int coins;
    private int status;
    private String regTime;
    private String lastTime;

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getBalance() {
        return balance;
    }

    public void setBalance(String balance) {
        this.balance = balance;
    }

    public int getCoins() {
        return coins;
    }

    public void setCoins(int coins) {
        this.coins = coins;
    }

    public int getCourierid() {
        return courierid;
    }

    public void setCourierid(int courierid) {
        this.courierid = courierid;
    }

    public String getDormitorRm() {
        return dormitorRm;
    }

    public void setDormitorRm(String dormitorRm) {
        this.dormitorRm = dormitorRm;
    }

    public String getDormitoryBd() {
        return dormitoryBd;
    }

    public void setDormitoryBd(String dormitoryBd) {
        this.dormitoryBd = dormitoryBd;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getLastTime() {
        return lastTime;
    }

    public void setLastTime(String lastTime) {
        this.lastTime = lastTime;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPreDormitoryBd() {
        return preDormitoryBd;
    }

    public void setPreDormitoryBd(String preDormitoryBd) {
        this.preDormitoryBd = preDormitoryBd;
    }

    public String getPreExpressAdd() {
        return preExpressAdd;
    }

    public void setPreExpressAdd(String preExpressAdd) {
        this.preExpressAdd = preExpressAdd;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getRegTime() {
        return regTime;
    }

    public void setRegTime(String regTime) {
        this.regTime = regTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStuCard() {
        return stuCard;
    }

    public void setStuCard(String stuCard) {
        this.stuCard = stuCard;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
