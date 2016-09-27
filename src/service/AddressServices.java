package service;

import model.Address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daddywolf on 16/7/26.
 */
public class AddressServices {

    public List queryAllAddress() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List alladdress = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT `address`.addressid,`userinfo`.username,`address`.receiver,`address`.mobile,`address`.dormitory_bd,`address`.dormitory_rm FROM shandianxia.address,shandianxia.userinfo WHERE shandianxia.address.userid=shandianxia.userinfo.userid GROUP BY `address`.addressid,`userinfo`.username,`address`.receiver,`address`.mobile,`address`.dormitory_bd,`address`.dormitory_rm ORDER BY shandianxia.address.userid ASC ");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Address address = new Address();
                address.setAddressid(rs.getInt(1));
                address.setUsername(rs.getString(2));
                address.setReceiver(rs.getString(3));
                address.setMobile(rs.getString(4));
                address.setDormitoryBd(rs.getString(5));
                address.setDormitoryRm(rs.getString(6));
                alladdress.add(address);
            }
            return alladdress;
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
