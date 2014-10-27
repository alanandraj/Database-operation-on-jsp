/**
 * Insertion Form Validation
 */

function validate() {
	
	alert("hi");

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
	document.getElementById("errSkills").innerHTML = "";
	document.getElementById("errEducation").innerHTML = "";
	document.getElementById("errcNumber").innerHTML = "";

	if (name.value == "" || name.value.length == 0) {
		document.getElementById("errName").innerHTML = " *";
		name.focus();
		return false;
	}
	if (age.value == "" || age.value.length == 0) {
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
