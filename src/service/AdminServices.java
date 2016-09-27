package service;


import encrypt.md5;
import model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daddywolf on 16/7/25.
 */
public class AdminServices {
    public boolean valiUser(Admin admin) {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("select adminid,realname from admin where mobile=? and password=?");
            pstmt.setString(1, admin.getMobile());
            pstmt.setString(2, md5.MD5(admin.getPassword()));
            rs = pstmt.executeQuery();
            if (rs.next()) {
                admin.setAdminid(rs.getInt(1));
                admin.setRealName(rs.getString(2));
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
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


    public List queryAllAdmin() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List alladmin = new ArrayList();
        try {
            pstmt = conn.prepareStatement("select adminid,mobile,username,gender,realname,status from shandianxia.admin");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminid(rs.getInt(1));
                admin.setMobile(rs.getString(2));
                admin.setUsername(rs.getString(3));
                admin.setGender(rs.getInt(4));
                admin.setRealName(rs.getString(5));
                admin.setStatus(rs.getInt(6));
                alladmin.add(admin);
            }
            return alladmin;
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


    public void login(int adminid) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement setStatus = null;
        try {
            setStatus = conn.prepareStatement("UPDATE admin SET status = 1 WHERE adminid = ? ");
            setStatus.setInt(1, adminid);
            setStatus.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (setStatus != null) setStatus.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }


    public void logout(int adminid) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement setStatus = null;
        try {
            setStatus = conn.prepareStatement("UPDATE admin SET status = 0 WHERE adminid = ? ");
            setStatus.setInt(1, adminid);
            setStatus.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (setStatus != null) setStatus.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }

}
