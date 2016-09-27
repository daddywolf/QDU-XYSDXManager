package service;

import model.Courier;
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
public class CourierServices {

    public List queryAllCourier() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List allcourier = new ArrayList();
        try {
            pstmt = conn.prepareStatement("select courierid,mobile,username,gender,realname,idcard,stucard,dormitory_bd,dormitory_rm,balance,coins,regtime,status from shandianxia.courier");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Courier user = new Courier();
                user.setCourierid(rs.getInt(1));
                user.setMobile(rs.getString(2));
                user.setUsername(rs.getString(3));
                user.setGender(rs.getInt(4));
                user.setRealName(rs.getString(5));
                user.setIdCard(rs.getString(6));
                user.setStuCard(rs.getString(7));
                user.setDormitoryBd(rs.getString(8));
                user.setDormitorRm(rs.getString(9));
                user.setBalance(rs.getString(10));
                user.setCoins(rs.getInt(11));
                if (rs.getString(12) == null) {
                } else {
                    user.setRegTime(FormatTime.Format(rs.getString(12)));
                }
                user.setStatus(rs.getInt(13));
                allcourier.add(user);
            }
            return allcourier;
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
