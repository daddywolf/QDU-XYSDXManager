package filter;

/**
 * Created by daddywolf on 16/3/6.
 */

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public class XssFilter implements Filter {

    public void init(FilterConfig config) throws ServletException {
    }

    /**
     * 看不懂，网上下的代码
     *
     * @param request  请求
     * @param response 返回
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper(
                (HttpServletRequest) request);
        chain.doFilter(xssRequest, response);
    }

    public void destroy() {
    }
}