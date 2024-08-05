<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="validation_process.jsp" id="ff" method="post">
	아이디 : <input type="text" name="id" id="id"> <br>
	비밀번호 : <input type="text" name="pw" id="pw"> <br>
	<input type="button" value="전송" onclick="clickSubmit()">
</form>
</body>
<script type="text/javascript">
function clickSubmit() {
	var form = document.querySelector('#ff');
	var id = document.querySelector('#id').value;
	var pw = document.querySelector('#pw').value;
	
	if (id == "") {
		alert('아이디를 입력해주세요');
		return false;
	}
	
	if (pw.includes(id)) {
		alert('비밀번호는 아이디를 포함할 수 없습니다');
		return false;
	}
	
	form.submit();
}
</script>
</html>