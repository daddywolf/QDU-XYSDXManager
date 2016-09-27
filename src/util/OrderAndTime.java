package util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * Created by daddywolf on 16/7/26.
 */
public class OrderAndTime {

    public static String getCreateTime() {
        Date date = new Date();
        DateFormat formatC = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createtime = formatC.format(date);
        return createtime;
    }

    public static String getOrderNumer() {
        Date date = new Date();
        DateFormat formatO = new SimpleDateFormat("yyyyMMddHHmm");
        String ordertime = formatO.format(date);
        Random ne = new Random();//实例化一个random的对象ne
        int random = ne.nextInt(9999 - 1000 + 1) + 1000;//为变量赋随机值100000-999999
        String ordernumber = ordertime + random;
        return ordernumber;
    }
}
