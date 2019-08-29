<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
<title>订单列表</title>

</head>
<body>
	机构名称<input type="text" id="whetherall" value="">
	客户经理姓名<input type="text" id="Mname" value="">
	<input type="button"  value="查询" onclick="query1()"><br/>
	
	<table id="myTable" cellpadding="1" cellspacing="0" border="1">
<caption align="top">订单列表</caption>
<thead>
<tr>
<th>订单号</th>
<th>客户经理姓名</th>
<th>用户姓名</th>
<th>商品名称</th>
<th>销售数量</th>
<th>总销售额</th>
</tr>
</thead>
<tbody></tbody>

</table>
	<script type="text/javascript">
function query1() {
	var whetherall = document.getElementById("whetherall").value;
	var Cname = document.getElementById("Mname").value;
	
		//ajax将邮箱传入后台			
		$.ajax({
			type : "POST", //请求的方式，默认get请求
			url : "Search", //请求地址，后台提供的
			data : {
				whetherall : whetherall,
				Cname : Cname
			},//data是传给后台的字段，后台需要哪些就传入哪些
			success : function(data) {
				var obj=eval(data);
				var tbody=$('<tbody></tbody>');
				$(obj).each(function (index){
				var val=obj[index];
				var tr=$('<tr></tr>');
				tr.append('<td>' +val.sid +'</td>' + '<td>'+ val.mname + '</td>' +'<td>'+ val.cname + '</td>' + '<td>'+ val.pname+ '</td>'+'<td>' +val.snum +'</td>'+'<td>' +val.ssum +'</td>');
				tbody.append(tr);
				});
				$('#myTable tbody').replaceWith(tbody);
			},
			error : function(data) {
				alert("此邮箱未注册");
			}
		})
	
}

	/*function query1() {
		var whetherall = document.getElementById("whetherall").value;
		var Cname = document.getElementById("Cname").value;						
		$.ajax({
				type : "POST", 
				url : "Search", 
				data : {
					Cname : Cname,
					whetherall : whetherall
				},
				success : function(data) {
					alert(data);
					var jsondatas = eval(data);
					$.each(jsondatas, function (i, item) {
			            
			                var tr = $("<tr><td>" + jsondatas[i].Sid+ "</td><td>" + jsondatas[i].Mname + "</td><td>" + jsondatas[i].Cname + "</td></tr>");
			                
			                $("#myTable").append(tr);
			              
			                });			            
				},
				error : function(data) {					
				}
			})
		}
	*/
</script>
</body>
</html>