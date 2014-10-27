package com.heart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Util
{
	static Statement stmt = null;
	static Connection con = null;
	static ResultSet rs = null;

	public static Statement getStatement()
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException ex)
		{

		}

		try
		{
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "system", "pass123");
			stmt = con.createStatement();
		} catch (SQLException ex)
		{

		}
		return stmt;
	}

	public static void closeConnection()
	{
		try
		{
			if (con != null)
			{

				con.close();
				con = null;
			}

		} catch (SQLException ex)
		{

		}

	}

	public static void closeStatement()
	{
		try
		{
			if (stmt != null)
			{

				stmt.close();
				stmt = null;
			}

		} catch (SQLException ex)
		{

		}

	}

	public static void closeResultSet()
	{
		try
		{
			if (rs != null)
			{

				rs.close();
				rs = null;
			}

		} catch (SQLException ex)
		{

		}

	}

}
