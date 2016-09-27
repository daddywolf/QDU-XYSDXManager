package model;

/**
 * Created by 姜志鹏 on 2016/4/27.
 */
public class UserInfo {
    private int userid;
    private String mobile;
    private String password;
    private String avatar;
    private String username;
    private int gender;
    private String realName;
    private String idCard;
    private String stuCard;
    private String dormitoryBd;
    private String dormitoryRm;
    private double balance;
    private int coins;
    private int status;
    private String regTime;
    private String lastTime;
    private int defaultaddress;

    public int getDefaultaddress() {
        return defaultaddress;
    }

    public void setDefaultaddress(int defaultaddress) {
        this.defaultaddress = defaultaddress;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public int getCoins() {
        return coins;
    }

    public void setCoins(int coins) {
        this.coins = coins;
    }

    public String getDormitoryBd() {
        return dormitoryBd;
    }

    public void setDormitoryBd(String dormitoryBd) {
        this.dormitoryBd = dormitoryBd;
    }

    public String getDormitoryRm() {
        return dormitoryRm;
    }

    public void setDormitoryRm(String dormitoryRm) {
        this.dormitoryRm = dormitoryRm;
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

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
