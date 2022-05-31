package com.saitej.util;


import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
//converting LocalDateTime to to String
public class DateUtil {

    public static String format(LocalDateTime localDateTime){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String format = now.format(formatter);
        return format;
    }
}
