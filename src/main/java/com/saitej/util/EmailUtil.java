package com.saitej.util;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.HtmlEmail;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;


public class EmailUtil {

    public static void sendMail(HttpServletRequest request)  {
        System.out.println("EmailUtil.sendMail");
        Map<String, String> props = PropertiesUtil.getProperties(request);
        HtmlEmail email = new HtmlEmail();
        try {
        email.setHostName(props.get("host"));
        email.setSmtpPort(Integer.parseInt(props.get("port")));
        email.setFrom(props.get("fromAddress"));
        email.addTo(props.get("toAddress"));
        email.setAuthenticator(new DefaultAuthenticator(props.get("username"),props.get("password")));
        email.setSSLOnConnect(true);
        email.setHostName(props.get("subject"));
        email.setTextMsg("YOU HAVE SUCCESSFULLY REGISTERED!!");
        email.send();
        System.out.println("Mail sent successfully..");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
