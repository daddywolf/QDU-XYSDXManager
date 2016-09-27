package service;

import model.Order;
import util.FormatTime;
import util.OrderAndTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daddywolf on 16/7/25.
 */
public class OrderServices {
    public List queryAllOrder() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List allorder = new ArrayList();
        try {
            pstmt = conn.prepareStatement("select `order`.orderid,`userinfo`.username,`order`.express_add,`order`.goods_code,`order`.others,courier.username,`order`.status,`order`.createtime,`order`.changetime,`order`.completetime,`order`.dormitory_bd,`order`.dormitory_rm,`order`.receiver,`order`.total_fee,`order`.mobile FROM `order`,`userinfo`,`courier` WHERE `order`.userid=`userinfo`.userid AND `order`.courierid=`courier`.courierid ORDER BY createtime DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderid(rs.getString(1));
                order.setUsername(rs.getString(2));
                order.setExpressAdd(rs.getString(3));
                order.setGoodsCode(rs.getInt(4));
                order.setOthers(rs.getString(5));
                order.setCouriername(rs.getString(6));
                order.setStatus(rs.getInt(7));
                order.setCreateTime(FormatTime.Format(rs.getString(8)));
                if (rs.getString(9) == null) {
                } else {
                    order.setChangeTime(FormatTime.Format(rs.getString(9)));
                }
                if (rs.getString(10) == null) {
                } else {
                    order.setChangeTime(FormatTime.Format(rs.getString(10)));
                }
                order.setDormitoryBd(rs.getString(11));
                order.setDormitoryRm(rs.getString(12));
                order.setReceiver(rs.getString(13));
                order.setTotal_fee(rs.getInt(14));
                order.setMobile(rs.getString(15));
                allorder.add(order);
            }
            return allorder;
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

    public boolean deleteOrder(String orderid) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("DELETE FROM `order` WHERE orderid=?");
            pstmt.setString(1, orderid);
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }

    public List queryUserId(String input) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List userid = null;
        try {
            pstmt = conn.prepareStatement("select userid FROM `userinfo` where `userinfo`.realname LIKE ? OR `userinfo`.mobile LIKE ?");
            pstmt.setString(1, input);
            pstmt.setString(2, input);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                userid.add(rs.getInt(1));
            }
            return userid;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }

    public List queryOrder(String orderid) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List orderinfo = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT userid,express_add,goods_code,others,courierid,status,dormitory_bd,dormitory_rm,receiver,mobile,total_fee FROM shandianxia.`order` where orderid=?");
            pstmt.setString(1, orderid);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Order o = new Order();
                o.setUserid(rs.getInt(1));
                o.setExpressAdd(rs.getString(2));
                o.setGoodsCode(rs.getInt(3));
                o.setOthers(rs.getString(4));
                o.setCourierid(rs.getInt(5));
                o.setStatus(rs.getInt(6));
                o.setDormitoryBd(rs.getString(7));
                o.setDormitoryRm(rs.getString(8));
                o.setReceiver(rs.getString(9));
                o.setMobile(rs.getString(10));
                o.setTotal_fee(rs.getInt(11));
                orderinfo.add(o);
            }
            return orderinfo;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }

    public boolean newOrder(Order order) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement("insert into `order`  (userid,express_add,goods_code,others,courierid,status,dormitory_bd,dormitory_rm,receiver,mobile,total_fee,orderid,createtime)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?) ");
            pstmt.setInt(1, order.getUserid());
            pstmt.setString(2, order.getExpressAdd());
            pstmt.setInt(3, order.getGoodsCode());
            pstmt.setString(4, order.getOthers());
            pstmt.setInt(5, order.getCourierid());
            pstmt.setInt(6, order.getStatus());
            pstmt.setString(7, order.getDormitoryBd());
            pstmt.setString(8, order.getDormitoryRm());
            pstmt.setString(9, order.getReceiver());
            pstmt.setString(10, order.getMobile());
            pstmt.setInt(11, order.getTotal_fee());
            pstmt.setString(12, OrderAndTime.getOrderNumer());
            pstmt.setString(13, OrderAndTime.getCreateTime());
            pstmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }

        }
    }


}
