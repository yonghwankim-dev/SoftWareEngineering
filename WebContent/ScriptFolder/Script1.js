/**
 * 
 */


function openPage(pageName, elmnt, color) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablink");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].style.backgroundColor = "";
			}
			document.getElementById(pageName).style.display = "block";
			elmnt.style.backgroundColor = color;
		}

		function popup_change() {
			var url = "changePopup.jsp";
			var name = "changePopup";
			window
					.open(
							url,
							name,
							"width=420, height=600, toolbar=no, status=no, location=no, scrollbar=no, menubar=no, resizable=no,left=50,right=50")
		}
		
		function go_Check()
		{
			var frm = document.formm;
			frm.action = "./LoginProcess.jsp";
			frm.submit();
		}


		function go_SignUp()
		{
			var frm = document.formm;
			
			if(frm.id.value == "")
			{
				alert("아이디를 입력하세요.");
				frm.id.focus();
			}else if(frm.passwd.value=="")
			{
				alert("비밀번호를 입력하세요.");
				frm.passwd.focus();
			}else{
				frm.action = "./LoginProcess.jsp";
				frm.submit();
			}
		}
		
		function go_SignUp()
		{
			var url = "SignUp.jsp";
			var name = "SignUp";
			
			window
			.open(
					url,
					name,
					"width=560, height=270, toolbar=no, status=no, location=no, scrollbar=no, menubar=no, resizable=no,left=50,right=50")
		}
		
		
		function go_SignUpProcess()
		{
			var frm = document.formm;
			frm.action = "./SignUpProcess.jsp";
			frm.submit();
		}
		
		function go_Close()
		{
			self.close();
		}
		
		function CheckAbledID()
		{
			var frm = document.formm;
			var radio_btn = frm.identity;
			
	        //라디오 버튼이 체크되었나 확인하기 위한 변수
	        var radio_btn_check = 0;
	        for(var i = 0; i<radio_btn.length; i++){
	            //만약 라디오 버튼이 체크가 되어있다면 true
	            if(radio_btn[i].checked==true){
	            	
	            	if(radio_btn[i].value=="student")
	            	{
	            		frm.name.disabled=false;
	            		frm.id.disabled=true;
	            		frm.passwd.disabled=false;
	            		frm.birthdate.disabled=false;
	            		frm.major.disabled=false;
	            		frm.grade.disabled=false;
	            		frm.personal_id.disabled=false;
	            		frm.phone.disabled=false;
	            	}else if(radio_btn[i].value=="manager")
	            	{
	            		frm.name.disabled=false;
	            		frm.id.disabled=false;
	            		frm.passwd.disabled=false;
	            		frm.birthdate.disabled=true;
	            		frm.major.disabled=true;
	            		frm.grade.disabled=true;
	            		frm.personal_id.disabled=true;
	            		frm.phone.disabled=false;
	            	}else{
	            		frm.name.disabled=true;
	            		frm.id.disabled=true;
	            		frm.passwd.disabled=true;
	            		frm.birthdate.disabled=true;
	            		frm.major.disabled=true;
	            		frm.grade.disabled=true;
	            		frm.personal_id.disabled=true;
	            		frm.phone.disabled=true;
	            	}
	            	
	                //라디오 버튼이 체크되면 radio_btn_check를 1로 만들어준다.
	                radio_btn_check++;
	            }
	        }
		}