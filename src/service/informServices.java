package service;

import model.Inform;
import util.FormatTime;
import util.OrderAndTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 姜志鹏 on 2016/2/24.
 */
public class informServices {

    /**
     * 查询全部通知
     *
     * @return
     */
    public List queryAllInform() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List infrom = new ArrayList();
        try {
            pstmt = conn.prepareStatement("select * from inform order by time desc");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Inform info = new Inform();
                info.setTime(FormatTime.Format(rs.getString(2)));
                info.setPublisher(rs.getString(3));
                info.setTitle(rs.getString(4));
                info.setContent(rs.getString(5));
                infrom.add(info);
            }
            return infrom;
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


    public boolean insertInform(Inform inform, String publisher) {
        Connection conn = new dao.Dao().getCon();
        PreparedStatement pstmt = null;
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = format.format(date);
        try {
            pstmt = conn.prepareStatement("insert into inform (time,publisher,title,content) VALUES(?,?,?,?) ");
            pstmt.setString(1, OrderAndTime.getCreateTime());
            pstmt.setString(2, publisher);
            pstmt.setString(3, inform.getTitle());
            pstmt.setString(4, inform.getContent());
            pstmt.execute();
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
