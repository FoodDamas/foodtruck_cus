package org.food.controller;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class AwsMariaDBConnectionTest {
	private static final String DRIVER = "org.mariadb.jdbc.Driver";
	private static final String URL = "jdbc:mariadb://fooddamas-db.ctidcwavayxv.ap-northeast-2.rds.amazonaws.com:3306/foodtruck";
	private static final String USER = "fooddamas"; // db 접속 id
	private static final String PW = "fooddamas12"; // db 접속 password

	@Test
	public void test() throws Exception {
		Class.forName(DRIVER);
		try (Connection con = DriverManager.getConnection(URL, USER, PW)) {
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}