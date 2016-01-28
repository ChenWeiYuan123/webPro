function login(){
		document.getElementById("form1").setAttribute("class", "form1 display");
		document.getElementById("userForm").setAttribute("class", "user display");
		document.getElementById("background").setAttribute("class", "background display");
		document.getElementById("form2").setAttribute("class", "form2 hidden");
		// document.getElementById("userForm").style.display="block";
	}
	function bgdDis(){

		document.getElementById("userForm").setAttribute("class", "user hidden");
		document.getElementById("background").setAttribute("class", "background hidden");
	}
	function register(){
		document.getElementById("userForm").setAttribute("class", "user display");
		document.getElementById("form2").setAttribute("class", "form2 display");
		document.getElementById("form1").setAttribute("class", "form1 hidden");
		document.getElementById("background").setAttribute("class", "background display");
	}
	function friend(){
		document.getElementById("TimeLine").style.color="#37AE60";
		document.getElementById("Hot").style.color="#878E80";
		document.getElementById("main-list").setAttribute("class", "main-list hidden");
		document.getElementById("friend-list").setAttribute("class", "friend-list display");
	}
	function Hot(){
		document.getElementById("TimeLine").style.color="#878E80";
		document.getElementById("Hot").style.color="#37AE60";
		document.getElementById("main-list").setAttribute("class", "main-list display");
		document.getElementById("friend-list").setAttribute("class", "friend-list hidden");
	}