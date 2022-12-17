 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 테스트</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function (){
		$("#checkJson").click(function (){
			var jsonStr = '{ "age": [2, 33, 44] }';
			var jsonAgeInfo = JSON.parse(jsonStr);
			var jsonStr = '{ "name": ["홍길동", "이순신", "임꺽정"] }';
			var jsonInfo = JSON.parse(jsonStr);
			var output = "회원이름과 나이<br>";
			output += "==========<br>";

			for (var i in jsonInfo.name) {
				output += jsonInfo.name[i] + " " + jsonAgeInfo.age[i] + "<br>";				
			}
			$("#output").html(output);			
		});
	});
</script>

</head>
<body>
	<a id="checkJson" style="cursor:pointer">출력</a><br><br>
    <div id="output"></div>
</body>
</html>