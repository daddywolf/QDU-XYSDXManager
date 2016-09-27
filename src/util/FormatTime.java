package util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by daddywolf on 16/7/26.
 */
public class FormatTime {
    public final static String Format(String time) {
        String strDate = time;
        // 准备第一个模板，从字符串中提取出日期数字
        String pat1 = "yyyy-MM-dd HH:mm:ss.0";
        // 准备第二个模板，将提取后的日期数字变为指定的格式
        String pat2 = "yyyy-MM-dd HH:mm:ss";
        SimpleDateFormat sdf1 = new SimpleDateFormat(pat1);        // 实例化模板对象
        SimpleDateFormat sdf2 = new SimpleDateFormat(pat2);        // 实例化模板对象
        Date d = null;
        try {
            d = sdf1.parse(strDate);   // 将给定的字符串中的日期提取出来
        } catch (Exception e) {            // 如果提供的字符串格式有错误，则进行异常处理
            e.printStackTrace();       // 打印异常信息
        }
        return sdf2.format(d);
    }
}
