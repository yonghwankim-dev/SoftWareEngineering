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


