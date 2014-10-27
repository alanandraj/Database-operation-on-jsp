package com.heart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertionServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
				
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String education=request.getParameter("education");
		String skills[]=request.getParameterValues("skills");
		String cNumber=request.getParameter("cNumber");
		
		String skill="";
		int status=0;
		PrintWriter out=response.getWriter();
		
		for(int i=0;i<skills.length;i++)
		{
			skill=skill+skills[i]+",";
		}
		
		/*System.out.println(name);
		System.out.println(age);
		System.out.println(email);
		System.out.println(gender);
		System.out.println(education);
		System.out.println(Arrays.toString(skills));
		System.out.println(cNumber);
		*/
		try
		{
			Statement stmt=Util.getStatement();
			
			String sql="insert into DB_TABLE values(DB_INSERT.nextval,'"+name+"',"+age+",'"+email+"','"+gender+"','"+education+"','"+skill+"','"+cNumber+"')";
			System.out.println(sql);
			status=stmt.executeUpdate(sql);
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Database Operation</title>");
			out.println("</head>");
			out.println("</html>");
			
			if (status>0)
			{
				
				out.println("Inserted successfully! Do you want insert one more ");
				out.println("<a href='insertion.jsp'>Click Here to Insert</a><br /><br />");
				out.println("OR<br /><br />");
				out.println("View all the Record");
				out.println("<a href='view.jsp'>Click Here to View</a><br /><br />");

				
			} else
			{
				out.println("error while saving");
			}

			
			
		}
		catch(Exception ex)
		{
			
		}
		finally
		{
			Util.closeResultSet();
			Util.closeStatement();
			Util.closeConnection();
		}
		
		
		
		
	}

}
