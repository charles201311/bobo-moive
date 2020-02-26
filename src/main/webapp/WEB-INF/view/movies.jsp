<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resource/bootstrap.css">
<script type="text/javascript" src="/resource/jquery-3.2.1.js"></script>
<title>电影的列表</title>

<script type="text/javascript">
// 分页
function goPage(page){
	location.href="/selects?"+$("form").serialize()+"&page="+page
}

function morder(orderName){
	
	var orderMethod = '${movieVO.orderMethod}';
	orderMethod= orderMethod=='desc'?'asc':'desc';
	location.href="/selects?"+$("form").serialize()+"&orderName="+orderName+"&orderMethod="+orderMethod;
}

//全选反选
function chk(flag){
	if(flag==1){//全选
	    $("[name='ids']").prop("checked",true);
		
	}else if(flag==2){//全不选
		
		 $("[name='ids']").prop("checked",false);
		
	}else{// 反选
		$("[name='ids']").each(function(){
			
		    $(this).prop("checked",!$(this).prop("checked"));
			
		})
	}
	
	
}

//批量删除
function deleteBatch(){
	var ids = new Array();//定义数组。用来存放选中的ID
	$("[name='ids']:checked").each(function(id){
		ids[id]  = $(this).val();
	});
	
	//如果用户没有选中，则执行删除
	if(ids.length==0){
		alert("请至少选中一个再删除");
		return ;
	}

	//执行删除
	$.post("/deleteBatch",{ids:ids},function(result){
		if(result){
			alert("操作成功");
			location.href="/selects";
		}else{
			alert("操作失败") ;
		}
	})
		
	
}

</script>
</head>
<body>
<form action="/selects" method="post">
电影名称: <input type="text" name="name" value="${movieVO.name }"> &nbsp;上映时间<input type="text" name="t1" value="${movieVO.t1 }">--<input type="text" name="t2" value="${movieVO.t2 }"><br>
导演： <input type="text" name="actor" value="${movieVO.actor }"> &nbsp;价格<input type="text" name="p1" value="${movieVO.p1 }">--<input type="text" name="p2" value="${movieVO.p2 }"><br>
年代： <input type="text" name="years" value="${movieVO.years }">&nbsp;电影时长<input type="text" name="l1" value="${movieVO.l1 }">--<input type="text" name="l2" value="${movieVO.l2 }"><br>
 <button type="submit" class="btn btn-info">查询</button>
 <button type="button" class="btn btn-warning" onclick="deleteBatch()">批量删</button>



</form>

	<table class="table">
		<tr>
		  <td> <input type="checkbox" onclick="chk(1)">全选
		       <input type="checkbox" onclick="chk(2)">全不选
		       <input type="checkbox" onclick="chk(3)">反选
		       </td>
			<td>序号</td>
			<td>电影名称</td>
			<td>导演</td>
			<td>上映日期</td>
			<td><a href="javascript:morder('longtime')">电影时长</a></td>
			<td><a href="javascript:morder('price')">价格</a></td>
			<td><a href="javascript:morder('years')">年代</a></td>
			<td>类型</td>
			<td>区域</td>
			<td>状态</td>

		</tr>
		<c:forEach items="${info.list }" var="movie" varStatus="i">

			<tr>
			    <td><input type="checkbox" name="ids" value="${movie.id }"></td>
				<td>${i.count }</td>
				<td>${movie.name }</td>
				<td>${movie.actor }</td>
				<td>${movie.uptime }</td>
				<td>${movie.longtime }</td>
				<td>${movie.price }</td>
				<td>${movie.years }</td>
				<td>${movie.type }</td>
				<td>${movie.area }</td>
				<td>${movie.status==1?"即将上映":movie.status==2?"正在热映":"已经下线" }</td>
			</tr>


		</c:forEach>

 
	</table>
	<jsp:include page="/WEB-INF/view/pages.jsp"/>
</body>
</html>