package com.heart;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UpdateServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Database Operation</title>");
		out.println("</head>");
		out.println("</html>");
		
		int id=Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		int age=Integer.parseInt(request.getParameter("age"));
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String education=request.getParameter("education");
		String skills[]=request.getParameterValues("skills");
		String cNumber=request.getParameter("cNumber");
		
		String skill="";
		int status=0;
				
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
			
			String sql="update DB_TABLE set ID="+id+", FNAME='"+name+"', AGE="+age+", EMAIL='"+email+"', GENDER='"+gender+"', EDUCATION='"+education+"', SKILLS='"+skill+"', CONTACT='"+cNumber+"' where ID="+id+"";
			System.out.println(sql);
			status=stmt.executeUpdate(sql);
			
			if (status>0)
			{
				
				out.println("Updated successfully! ");
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
