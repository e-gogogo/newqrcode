<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
<title>Insert title here</title>

</head>
<body>
	<center>
		<img id = "imageId"  width="300" height="300" />
	</center>
	
	<script type="text/javascript">
var url=location.search;
var add = url.split("=");
//alert(add[1]);
var add1 = add[1].split("/");
var add2 = "../" + add1[4] + "/" +add1[5] + ""; 
//alert(add2);
document.getElementById("imageId").src=add2;

</script>
</body>
</html>