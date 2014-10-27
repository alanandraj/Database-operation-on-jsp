<%@page import="java.io.*" %>

<html>
<head>
<title>Insertion Form</title>
<link rel="stylesheet" type="text/css" href="style.css">

<!-- <script src="validateForm.js">

</script> -->

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

	<form name="insertForm" action="InsertionServlet"
		onsubmit="return validate()">
		<table>
		<tr>
		<th colspan="2">INSERTION FORM</th>
		</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" /> <span id="errName"
					class="errClass"></span></td>
			</tr>

			<tr>
				<td>Age</td>
				<td><input type="text" name="age" /> <span id="errAge"
					class="errClass"></span></td>
			</tr>

			<tr>
				<td>E-mail</td>
				<td><input type="text" name="email" /> <span id="errEmail"
					class="errClass"></span></td>
			</tr>

			<tr>
				<td>Gender</td>
				<td><input type="radio" name="gender" value="male" /> Male <input
					type="radio" name="gender" value="female" /> Female <span
					id="errGender" class="errClass"></span></td>
			</tr>


			<tr>
				<td>Education</td>
				<td><select name="education">
						<option value="select" selected>--Select--</option>
						<option value="bsc">BSc</option>
						<option value="bca">BCA</option>
						<option value="be">BE</option>
						<option value="mca">MCA</option>
						<option value="mba">MBA</option>
						<option value="m.tech">M.Tech</option>
						
				</select> <span id="errEducation" class="errClass"></span></td>
			</tr>

			<tr>
				<td>Skills</td>
				<td><input type="checkbox" name="skills" value="c" />C 
				<input type="checkbox" name="skills" value="c++" />C++ 
				<input type="checkbox" name="skills" value="java" />Java 
				<input type="checkbox" name="skills" value=".net" />.Net 
				<input type="checkbox" name="skills" value="oracle" />Oracle 
				<span id="errSkills" class="errClass"></span></td>
			</tr>

			<tr>
				<td>Contact Number</td>
				<td><input type="text" name="cNumber" /> <span id="errCnumber"
					class="errClass"></span></td>
			</tr>



			<tr>
				<td colspan="2"><center><input type="submit" value="Submit" class="btn_submit"/></center></td>
			</tr>
		</table>

	</form>
	
</body>

</html>