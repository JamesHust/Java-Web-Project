<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-81">
<title>Insert title here</title>
</head>
<body>
	 <form action="RegisterController" method="get">
		<input type="hidden" name="command" value="CREATEUSER">
		<input type="text" name="nameUser" placeholder="Ho Ten">
		<input type="text" name="dobUser" placeholder="Ngay sinh">
		<input type="text" name="addressUser" placeholder="Dia chi">
		<input type="text" name="genderUser" placeholder="Gioi tinh">
		<input type="text" name="phoneUser" placeholder="So dien thoai">
		<input type="email" name="emailUser" placeholder="Email">
		<input type="password" name="passUser" placeholder="Mat khau">
		<input type="submit" value="Dang ky">
	</form> 
</body>
</html>