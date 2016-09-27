package servlet;

import service.OrderServices;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by 姜志鹏 on 2016/5/15.
 */
@WebServlet(name = "DeleteOrder")
public class DeleteOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码格式
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/x-javascript;charset=utf-8");
        //获取请求中的mobile参数
        String orderid = request.getParameter("orderid");
        //jdbc查询
        OrderServices os = new OrderServices();
        if (os.deleteOrder(orderid)) {
            response.getWriter().write("1");
            response.getWriter().flush();
            response.getWriter().close();
        } else {
            response.getWriter().write("0");
            response.getWriter().flush();
            response.getWriter().close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
