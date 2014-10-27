<html>
<head>

<title>Database Operation</title>
</head>


</html>
<%@page import="com.heart.Util"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");

Statement stmt=null;
ResultSet rs=null;
int status=0;
try
{
	stmt=Util.getStatement();
	String sql="delete from DB_TABLE where ID="+id+"";
	//System.out.println(sql);
	status=stmt.executeUpdate(sql);
	
	if(status>0)
	{
		out.println("Deleted successfully! ");
		out.println("<a href='view.jsp'>Click Here to View</a><br /><br />");
	}
	else
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

	
%>