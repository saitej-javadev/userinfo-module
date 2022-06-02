package com.saitej.util;

import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static Logger LOGGER = Logger.getLogger(DBUtil.class);

	private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
	//private static final String URL ="jdbc:mysql://localhost:3306/demo?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private static final String URL ="jdbc:mysql://localhost:3306/demo";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";
    
	public static Connection getConnection() {
		LOGGER.info(" in getConnection method");
		Connection con = null;
		try {
			Class.forName(DRIVER);
			con= DriverManager.getConnection(URL,USERNAME,PASSWORD);
			LOGGER.debug("Connection established..");
		} catch (ClassNotFoundException | SQLException e) {
			//e.printStackTrace();
			LOGGER.error("Logging connection error: " +e.getMessage());
		}
		return con;
	}

}
