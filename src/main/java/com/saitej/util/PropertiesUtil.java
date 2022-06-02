package com.saitej.util;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class PropertiesUtil {
    public static Map<String, String> getProperties(HttpServletRequest request) {
        System.out.println("PropertiesUtil.getProperties");
        Properties p=new Properties();
        try {
            FileInputStream inputStream = new FileInputStream("D:\\saitejWS\\userinfo-module\\src\\main\\resources\\application.properties");
            p.load(inputStream);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Map<String,String> mailProps = new HashMap<>();
        mailProps.put("host",p.getProperty("smtp.host"));
        mailProps.put("port",p.getProperty("smtp.port"));
        mailProps.put("fromAddress",p.getProperty("smtp.fromAddress"));
        mailProps.put("toAddress",request.getParameter("email"));
        mailProps.put("username",p.getProperty("smtp.username"));
        mailProps.put("password",p.getProperty("smtp.password"));
        mailProps.put("subject",p.getProperty("smtp.subject"));
        System.out.println(mailProps);
        return mailProps;
    }
}
