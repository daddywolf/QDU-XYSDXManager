package service;

import model.Feedback;
import util.FormatTime;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by daddywolf on 16/7/28.
 */
public class FeedBackServices {
    public List queryAllFeedback() {
        Connection conn = new dao.Dao().getCon();
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        List allfeedback = new ArrayList();
        try {
            pstmt = conn.prepareStatement("SELECT feedbackid,userinfo.username,userinfo.mobile,title,content,createtime,status FROM feedback,userinfo WHERE feedback.userid=userinfo.userid");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackid(rs.getInt(1));
                feedback.setUsername(rs.getString(2));
                feedback.setMobile(rs.getString(3));
                feedback.setTitie(rs.getString(4));
                feedback.setContent(rs.getString(5));
                feedback.setCreateTime(FormatTime.Format(rs.getString(6)));
                feedback.setStatus(7);
                allfeedback.add(feedback);
            }
            return allfeedback;
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
