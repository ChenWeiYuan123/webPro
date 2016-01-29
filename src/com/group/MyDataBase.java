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

	// ִ��SQL�������, ���ز���״̬
	public static boolean executeInsert(String sqlSentence) {
		Statement stat;
		boolean ok = false;
		try {
			stat = conn.createStatement(); // �������ӻ�ȡһ��ִ��sql���Ķ���
			stat.execute(sqlSentence); // ִ��sql���,������Ӱ���м�¼�ĸ���
			ok = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ok;
	}


	// ִ��SQL��ѯ���, ���ؽ����
	static public ResultSet executeQuery(String sqlSentence) {
		Statement stat;
		ResultSet rs = null;

		try {
			stat = conn.createStatement(); // ��ȡִ��sql���Ķ���
			rs = stat.executeQuery(sqlSentence); // ִ��sql��ѯ�����ؽ����
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return rs;
	}

	// ִ��SQL�޸����, ���ؽ����
	public static boolean executeUpdate(String sqlSentence) {
		Statement stat;

		try {
			stat = conn.createStatement(); // �������ӻ�ȡһ��ִ��sql���Ķ���
			cnt = stat.executeUpdate(sqlSentence); // ִ��sql���,������Ӱ���м�¼�ĸ���
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return (cnt >= 0);
	}

	// ִ��SQLɾ�����
	public static boolean executeDelete(String sqlSentence) {
		Statement stat;

		try {
			stat = conn.createStatement(); // �������ӻ�ȡһ��ִ��sql���Ķ���
			cnt = stat.executeUpdate(sqlSentence); // ִ��sql���,������Ӱ���м�¼�ĸ���
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return (cnt > 0);
	}


}
