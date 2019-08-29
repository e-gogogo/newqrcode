<!DOCTYPE html>
<html>
<script type="text/javascript" src="../js/jquery-1.6.2.min.js"></script>
<script type="text/javascript">
	function query() {
		var whetherall = document.getElementById("whetherall").value;
		var Cname = document.getElementById("Cname").value;
		
			//ajax将邮箱传入后台			
			$.ajax({
				type : "POST", //请求的方式，默认get请求
				url : "Search", //请求地址，后台提供的
				data : {
					Cname : Cname,
					whetherall : whetherall
				},//data是传给后台的字段，后台需要哪些就传入哪些
				success : function(data) {
					alert(data);
					var jsondatas = eval(data);
					$.each(jsondatas, function (i, item) {//遍历
			            //通过 Jsondates[i].name 可以取出json里面的值
			                var tr = $("<tr><td>" + jsondatas[i].Sid+ "</td><td>" + jsondatas[i].Mname + "</td><td>" + jsondatas[i].Cname + "</td></tr>");
			                //动态生成列表
			                $("#myTable").append(tr);
			              
			                });

			            });
				},
				error : function(data) {
					alert("此邮箱未注册");
				}
			})
		}
	
<script>
//查询分类数据
        $.get("SaleInfo/searchLowerList",{},function (data) {
            //[{Md:1ii,cname:Mlevel},{},{}]
            var lis = '<li class="nav-active"> </li>';
            //遍历数组,拼接字符串(<li>)
            for (var i = 0; i < data.length; i++) {
                var li = '<li><a href="route_list.html?cid='+data[i].cid+'">'+data[i].cname+'</a></li>';

                lis += li;
                
            }

            //将lis字符串，设置到ul的html内容中
            $("#category").html(lis);
        });

    });

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="whetherall">机构名称
	<input type="text" id="Mname">客户经理姓名
	<input type="button"  value="查询" onclick="query()"><br/>
	
	<table id="myTable" cellpadding="1" cellspacing="0" border="1">
<caption align="top">订单详情</caption>
<thead>
<tr>
<th>流程ID</th>
<th>流程名称</th>
<th>流程版本</th>
<th>操作</th>
</tr>
</thead>
<tbody></tbody>

</table>
	
</body>
</html>