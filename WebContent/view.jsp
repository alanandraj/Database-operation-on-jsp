<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*" %>
<%@page import="com.heart.Util" %>


<html>
<head>
<title>View Form</title>
<link rel="stylesheet" type="text/css" href="styleView.css">


 <script>
 function ConfirmDelete(id)
 {
   var x = confirm("Are you sure you want to delete? " +id);
   if (x)
       return true;
   else
     return false;
 }
        </script>

</head>
<body>
<table border=1>
<tr>

<th>ID</th>
<th>NAME</th>
<th>AGE</th>
<th>EMAIL</th>
<th>GENDER</th>
<th>EDUCATION</th>
<th>SKILLS</th>
<th>CONTACT</th>
<th colspan="2">ACTION</th>
</tr>



<%

Statement stmt=null;
ResultSet rs=null;

try
{
	stmt=Util.getStatement();
	String sql="select * from DB_TABLE";
	
	rs=stmt.executeQuery(sql);
	
	//String skills=rs.getString("SKILLS");
	//out.println(skills);
	
	while(rs.next())
	{
		%>
		<tr>
		<td><%=rs.getString("ID") %></a></td>
		<td><%=rs.getString("FNAME") %></td>
		<td><%=rs.getString("AGE") %></td>
		<td><%=rs.getString("EMAIL") %></td>
		<td><%=rs.getString("GENDER") %></td>
		<td><%=rs.getString("EDUCATION") %></td>
		
		<% 
		String skill=rs.getString("SKILLS");
		%>
		<td><%=skill.substring(0, skill.length()-1) %></td>
		<td><%=rs.getString("CONTACT") %></td>
		<td><a href="editData.jsp?id=<%=rs.getString("ID") %>">Edit</a></td>
		<td><a href="deleteData.jsp?id=<%=rs.getString("ID") %>" 
			onclick="return ConfirmDelete(<%=rs.getString("ID") %>);">Delete</a>
							
		</tr>
		
		<%
		
				
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



</table>
</body>
</html>