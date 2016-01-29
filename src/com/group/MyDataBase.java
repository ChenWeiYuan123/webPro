package com.group;
import java.sql.*;
import java.util.*;

public class MyDataBase {
	static private Connection conn;
	private static int cnt;
	public static boolean connect() {
		String connectString = "jdbc:mysql://localhost/proj"
				+ "?autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(connectString, "root", "123456");
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

	// 执行SQL插入语句, 返回插入状态
	public static boolean executeInsert(String sqlSentence) {
		Statement stat;
		boolean ok = false;
		try {
			stat = conn.createStatement(); // 根据连接获取一个执行sql语句的对象
			stat.execute(sqlSentence); // 执行sql语句,返回所影响行记录的个数
			ok = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ok;
	}


	// 执行SQL查询语句, 返回结果集
	static public ResultSet executeQuery(String sqlSentence) {
		Statement stat;
		ResultSet rs = null;

		try {
			stat = conn.createStatement(); // 获取执行sql语句的对象
			rs = stat.executeQuery(sqlSentence); // 执行sql查询，返回结果集
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}

	// 执行SQL修改语句, 返回结果集
	public static boolean executeUpdate(String sqlSentence) {
		Statement stat;

		try {
			stat = conn.createStatement(); // 根据连接获取一个执行sql语句的对象
			cnt = stat.executeUpdate(sqlSentence); // 执行sql语句,返回所影响行记录的个数
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return (cnt >= 0);
	}

	// 执行SQL删除语句
	public static boolean executeDelete(String sqlSentence) {
		Statement stat;

		try {
			stat = conn.createStatement(); // 根据连接获取一个执行sql语句的对象
			cnt = stat.executeUpdate(sqlSentence); // 执行sql语句,返回所影响行记录的个数
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return (cnt > 0);
	}


}
