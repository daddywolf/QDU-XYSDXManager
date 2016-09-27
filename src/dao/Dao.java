package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dao {
    /**
     * 获取数据库连接
     *
     * @return 返回一个Connection连接
     */
    public Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
//            String url = "jdbc:mysql:///shandianxia?useUnicode=true&characterEncoding=utf-8&useServerPrepStmts=true&cachePrepStmts=true";
            String url = "jdbc:mysql://database.aiflashman.com/shandianxia?useUnicode=true&characterEncoding=utf-8&useServerPrepStmts=true&cachePrepStmts=true";
//            String user = "root";
            String user = "shandianxia";
//            String password = "962464";
            String password = "shandianxia_!";
            Connection conn = DriverManager.getConnection(url, user, password);
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
