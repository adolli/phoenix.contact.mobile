<!DOCTYPE html>
<html>
	<head>
		<title>client-test</title>
        <meta charset="utf-8" />
		<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript">
			function ajaxtest() {
			    $.ajax({
			        url: "ajaxtest",
			        type: "post",
			        data: {
			            key: "123"
			        },
			        datatype: "json",
			        success: function(data) {
			            alert("echo: " + data);
			            if (data["meg"]) {
			                $("#reply").text("ok!!!");
			            } else {
			                $("#reply").text("error!!!");
			            }
			        },
			        error: function(XMLHttpRequest, info, e){
			            alert("error: " + XMLHttpRequest.readyState);
			        }
			    });
			}

			$(document).ready(function(){
			    $("#main").html("<button id='button' onclick='ajaxtest();'>button</button>");
			});

		</script>
	</head>
	<body>
		<div id="main">
			<button id='button' onclick='ajaxtest();'>button</button>
		</div>
		<p id="reply">---</p>
	</body>
</html>
