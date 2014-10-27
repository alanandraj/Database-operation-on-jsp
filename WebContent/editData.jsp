
<%@page import="com.heart.Util"%>
<%@page import="java.sql.*"%>

<%
String id=request.getParameter("id");

Statement stmt=null;
ResultSet rs=null;
try
{
	stmt=Util.getStatement();
	String sql="select * from DB_TABLE where ID="+id+"";
	//System.out.println(sql);
	rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		%>
		
<html>
<head>
<title>Edit Form</title>
<link rel="stylesheet" type="text/css" href="style.css">

<script>

function validate() {
	
	var name = document.insertForm.name;
	var age = document.insertForm.age;
	var email = document.insertForm.email;
	var gender = document.insertForm.gender;
	var education = document.insertForm.education;
	var skills = document.insertForm.skills;
	var cNumber = document.insertForm.cNumber;
				
	document.getElementById("errName").innerHTML = "";
	document.getElementById("errAge").innerHTML = "";
	document.getElementById("errEmail").innerHTML = "";
	document.getElementById("errGender").innerHTML = "";
	document.getElementById("errEducation").innerHTML = "";
	document.getElementById("errSkills").innerHTML = "";
	document.getElementById("errCnumber").innerHTML = "";
				
	if(name.value==null || name.value.length==0)
		{
		document.getElementById("errName").innerHTML = " *";
		name.focus();
		return false;
		}
	if(age.value==null || age.value.length==0)
	{
	document.getElementById("errAge").innerHTML = " *";
	age.focus();
	return false;
	}
	if (email.value == "" || email.value.length == 0) {
		document.getElementById("errEmail").innerHTML = " *";
		email.focus();
		return false;
	}
	var flag = true;
	for (var i = 0; i < gender.length; i++) {
		if (gender[i].checked) {
			flag = false;
		}
	}
	if (flag) {
		document.getElementById("errGender").innerHTML = " *";
		return false;
	}
	if (education.value == "select") {
		document.getElementById("errEducation").innerHTML = " *";
		education.focus();
		return false;
	}
	var flag = true;
	for (var i = 0; i < skills.length; i++) {
		if (skills[i].checked) {
			flag = false;
		}
	}
	if (flag) {
		document.getElementById("errSkills").innerHTML = " *";
		return false;
	}
	if (cNumber.value == "" || cNumber.value.length == 0) {
		document.getElementById("errCnumber").innerHTML = " *";
		cNumber.focus();
		return false;
	}
	
	// Other validations

	if (isNaN(age.value)) {
		document.getElementById("errAge").innerHTML = " Age should be number";
		age.focus();
		return false;
	}

	if (age.value < 1 || age.value > 100) {
		document.getElementById("errAge").innerHTML = " Age should be 1 to 100";
		age.focus();
		return false;
	}

	if (isNaN(cNumber.value)) {
		document.getElementById("errCnumber").innerHTML = " Contact Number should be number";
		cNumber.focus();
		return false;
	}

	var email_val = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if (!email_val.test(email.value)) {
		document.getElementById("errEmail").innerHTML = " Enter valid email id";
		email.focus();
		return false;
	}

	var cNumber_val = /^[0-9]{10}$/;
	if (!cNumber_val.test(cNumber.value)) {
		document.getElementById("errCnumber").innerHTML = " Contact Number should be 10 digit";
		cNumber.focus();
		return false;
	}

	
}


</script>

</head>

<body>
		<form name="insertForm" action="UpdateServlet" onsubmit="return validate()">
		<table>
		<tr>
		<th colspan="2">UPDATION FORM</th>
		</tr>
		
		<tr>
		<td>Id </td>
		<td><input type="text" name="id" value="<%=rs.getString("ID")%>" /> </td>
		</tr>
		
		<tr>
		<td>Name </td>
		<td><input type="text" name="name" value="<%=rs.getString("FNAME")%>" /> <span id="errName"
					class="errClass"></span></td>
		</tr>
		
		<tr>
		<td>Age </td>
		<td><input type="text" name="age" value="<%=rs.getString("AGE") %>" />
		 <span id="errAge" class="errClass"></span></td>
		</tr>
		
		<tr>
		<td>Email </td>
		<td><input type="text" name="email" value="<%=rs.getString("EMAIL") %>" />
		 <span id="errEmail"	class="errClass"></span></td>
		</tr>
		
		<tr>
		<td>Gender </td>
		<td>
		
		<input type="radio" name="gender" value="male" <%=(rs.getString("GENDER").equals("male"))?"checked":""%> />Male 
		<input type="radio" name="gender" value="female" <%=(rs.getString("GENDER").equals("female"))?"checked":""%> />Female
		 <span id="errGender" class="errClass"></span></td>
		</tr>
		
		
		<tr>
				<td>Education</td>
				<td><select name="education">
						<option value="select">--Select--</option>
						<option value="bsc" <%=(rs.getString("EDUCATION").equals("bsc"))?"selected":""%>>BSc</option>
						<option value="bca" <%=(rs.getString("EDUCATION").equals("bca"))?"selected":""%>>BCA</option>
						<option value="be" <%=(rs.getString("EDUCATION").equals("be"))?"selected":""%>>BE</option>
						<option value="mca" <%=(rs.getString("EDUCATION").equals("mca"))?"selected":""%>>MCA</option>
						<option value="mba" <%=(rs.getString("EDUCATION").equals("mba"))?"selected":""%>>MBA</option>
						<option value="m.tech" <%=(rs.getString("EDUCATION").equals("mba"))?"selected":""%>>M.Tech</option>
				</select> <span id="errEducation" class="errClass"></span></td>
			</tr>
			
			
			<%
			String skill=rs.getString("SKILLS");
			String skills[]=skill.split(",");
					
			%>
			
			<tr>
				<td>Skills</td>
				<td><input type="checkbox" name="skills" value="c" 
				
				<%
				for(int i=0;i<skills.length;i++)
				{
					if(skills[i].equals("c"))
					{
						%>
						checked
						<%
					}
					
				}
				%>
				
				
				 />C 
				 
				 <input	type="checkbox" name="skills" value="c++" 
					<%
				for(int i=0;i<skills.length;i++)
				{
					if(skills[i].equals("c++"))
					{
						%>
						checked
						<%
					}
					
				}
				%>
									
					/>C++ 
					
					<input type="checkbox" name="skills" value="java" 
					<%
				for(int i=0;i<skills.length;i++)
				{
					if(skills[i].equals("java"))
					{
						%>
						checked
						<%
					}
					
				}
				%>
					
					/>Java 
					
					<input type="checkbox" name="skills" value=".net" 
					<%
				for(int i=0;i<skills.length;i++)
				{
					if(skills[i].equals(".net"))
					{
						%>
						checked
						<%
					}
					
				}
				%>
					
					/>.Net
					
					<input type="checkbox" name="skills" value="oracle" 
					<%
				for(int i=0;i<skills.length;i++)
				{
					if(skills[i].equals("oracle"))
					{
						%>
						checked
						<%
					}
					
				}
				%>
					
					/>Oracle  
					 <span id="errSkills" class="errClass"></span></td>
			</tr>
			
			
			<tr>
		<td>Contact </td>
		<td><input type="text" name="cNumber" value="<%=rs.getString("CONTACT") %>" />
		
		 <span id="errCnumber" class="errClass"></span></td>
		</tr>
		
		<tr>
		<tr>
				<td colspan="2"><center><input type="submit" value="Update" class="btn_submit"/></center></td>
			</tr>
		</table>
		</form>
		</body>
		</html>
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

