package service;

import model.UserInfo;
import util.FormatTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daddywolf on 16/7/25.
 */
public class UserInfoServices {

    public List queryAllUser() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List alluser = new ArrayList();
        try {
            pstmt = conn.prepareStatement("select userid,mobile,username,gender,realname,idcard,stucard,dormitory_bd,dormitory_rm,balance,coins,regtime from shandianxia.userinfo");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                UserInfo user = new UserInfo();
                user.setUserid(rs.getInt(1));
                user.setMobile(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setGender(rs.getInt(4));
                user.setRealName(rs.getString(5));
                user.setIdCard(rs.getString(6));
                user.setStuCard(rs.getString(7));
                user.setDormitoryBd(rs.getString(8));
                user.setDormitoryRm(rs.getString(9));
                user.setBalance(rs.getDouble(10));
                user.setCoins(rs.getInt(11));
                user.setRegTime(FormatTime.Format(rs.getString(12)));
                alluser.add(user);
            }
            return alluser;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }
}
