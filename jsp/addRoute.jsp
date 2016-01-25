<%@ page language="java" import="java.util.*" import ="java.util.Date"  import="java.sql.*" pageEncoding="utf-8" %>
<%request.setCharacterEncoding("utf-8");%>
<%
Cookie[] cookies = request.getCookies();
String name="";
String value="";
String username="";
String id="";
String[] rescookies=new String[2];
for(Cookie cookie : cookies){
	name= cookie.getName();// get the cookie name
	if("username".equals(name))
	value=cookie.getValue();
	rescookies=value.split(",");// get the cookie value
	username=rescookies[0];
	id=rescookies[0];
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>index</title>
	<meta charset=utf-8>
	<meta name=viewport content="width=device-width, initial-scale=1">
	<style type="text/css">
		html,body{
		margin: 0;
		padding: 0;
		border: 0;	
		height: 100%;
		width: 100%;
		font-size: 100%;
		font-family: "微软雅黑", sans-serif;
		color: #ffffff;
		background-color: white;
		position:absolute;
		z-index:1;
		
		}
		body{
			background:url(img/route.jpg)  100% 100%;
			/*background-repeat: no-repeat;*/
		
		}
		.banner{
			opacity: 0.8;
			text-align: center;
			width: 100%;
			height: 12%;
			background-color:#606270;
			border: 0px solid #ffffff;
			padding-top: 1px;
		}
		.main{
			position: fixed;
			width: 100%;
			margin: 1em;
			/*padding: 1em;*/
			text-align: center;
		}
		form{
			display: block;
			clear: both;
			float: left;
			width: 15em;
			border: 3px solid #606270;
			padding: 1em;
			margin: 1em;
			color: #606270;
			background-color: white;
			opacity: 0.88;
			/*display: inline-block;*/
		}
		form input[type=button]{
			
			font-family: "微软雅黑", sans-serif;
			background-color:#606270;
			padding: 0.5em;
			width: 5em;
			margin: 1em;
			cursor: pointer;
			color: #FFF;
			font-weight: bold;
			border: none;	
			border-radius: 8%;
		}
		form input[type=submit]{
			
			font-family: "微软雅黑", sans-serif;
			background-color:#606270;
			padding: 0.5em;
			width: 5em;
			margin: 1em;
			cursor: pointer;
			color: #FFF;
			font-weight: bold;
			border: none;	
			border-radius: 8%;
		}
		#route{
			width: 100%;
			height: 80%;
			overflow-x: hidden; overflow-y: auto;
			margin-top: 5em;
			/*padding: 1em;*/
			text-align: center;
		}
		.content{
			/*position: absolute;*/
			position: relative;
			width: 50%;
			margin-right: auto;
			margin-left: auto;
			opacity: 0.7;
			/*left: 0;*/
			/*right: 0;*/
			border: 2px solid #606270;
			/*top: 5em;*/
			padding: 1em;
			background-color: #fefeff;
			text-align: center;
		}
		.addr{
			opacity: 0.8;
			margin: auto;
			padding: 1em;
			color: #606270;
			background-color: #eeeeff;
			border: 3px solid #606270;
			width: 3em;
			height: 3em;
		}
		.spot{
			opacity: 0.8;
			margin: auto;
			padding: 1em;
			color: #606270;
			background-color: #eeeeff;
			border: 3px solid #606270;
			width: 3em;
			height: 3em;
			border-radius: 50%;
		}
		.traffic{
			opacity: 0.8;
			margin: auto;
			padding-left: 0.3em;
			padding-top: 1em;
			color: #606270;
			background-color: #fff;
			border-left: 3px solid #606270;
			width: 0.1em;
			height: 5em;
			
		}
		.trafficH{
			margin-right: auto;
			margin-left: auto;
			margin-top: -5em;
			padding-left: 0.3em;
			padding-bottom: 1.5em;
			color: #606270;
			background-color: #fff;
			border-bottom: 3px solid #606270;
			width: 5em;
			height: 0.1em;
			
		}
		.focus{
			background-color: #eeffee;
		}
		.deleteDiv{
			display: none;
		}
	</style>
	
</head>

<body >
	
	<div class="banner">
		<h1>创建行程</h1>
		<label>用户名：</label><%=value %>
	</div>

	<div class="main">
		<form>
			
			<p>添加地点</p>
			<label>名称</label>
			<input type="text" name="addrname" id="addAddrText">
			<br>
			<input id="addAddr" type="button" value="添加">
		</form>
		<form>
			
			<p>添加景点</p>
			<label>名称</label>
			<input  type="text" name="spotname" id="addSpotText"draggable="true" ondragstart="drag(event)">
			<br>
			<input id="addSpot" type="button" value="添加" >
		</form>
		<form>
			
			<p>添加交通</p>
			<label>名称</label>
			<input  type="text" name="trafficname" id="addTrafficText">
			<br>
			<input id="addTraffic" type="button" value="添加" >
		</form>
		<form action="jsonRes.jsp" method="post">
			<input id="deleteDiv" type="button" value="删除" >
			<input id="back" type="button" value="撤销" >
			<input id="jsonStr"name="jsonStr" type="text">
			<input id="save" type="button" value="保存" >
			<input id="save" type="submit" value="提交" >
		</form>

	</div>
	<div id="route" ondrop="drop(event)" ondragover="allowDrop(event)">
		
	</div>

</body>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	
	var addAddr=$('#addAddr');
	var addSpot=$('#addSpot');
	var addTraffic=$('#addTraffic');
	var onFocusDiv='';
	var onFocusDivParent=$('#route');
	var deleteDiv=$('#deleteDiv');
	var save=$('#save');
	var back=$('#back');
	var ID=0;
	var backStack=new Array();
	var backHash=new Object();
	// function funcClick(event){
	// 	$(event.target).addClass('focus');
	// 	onFocusDiv=$(event.target).parent();
	// };

	onFocusDiv=$('#route');
	
	addAddr.on('click',function(){
		var addAddrText=$('#addAddrText').val();

		var addrContent=$("<div></div>")
		addrContent.addClass('content');
		addrContent.attr('id',ID);
		backStack.push(ID);
		backHash[ID]="add";
		ID=ID+1;
		

		var addr=$("<div></div>")
		addr.text(addAddrText);
		addr.addClass('addr');
		addr.attr('draggable','true');
		addr.attr('id',ID);
		backStack.push(ID);
		backHash[ID]="add";
		ID=ID+1;
		

		addrContent.append(addr);
		onFocusDivParent.append(addrContent);
		// addr.click( funcClick(event));
		addr.on('ondragstart',function(event){
			alert('ondragstart');
			event.dataTransfer.setData("Text",event.target.id);
			
		});
		// addr.attr('ondragstart',drag(event));
		// addr.on('ondragstart',drag(event));
		addr.on('click',function(event){
			onFocusDiv.removeClass('focus');
			onFocusDiv=$(event.target);
			$(event.target).addClass('focus');
			onFocusDivParent=$(event.target).parent();
		});
		addrContent.on('ondrop',function(event){
			alert('ondrop');
			event.preventDefault();
			var data=event.dataTransfer.getData("Text");
			alert(data);
			$(event.target).append($(document.getElementById(data)));
		});
		addrContent.on('ondragover',function(event){
			alert('ondragover');
			event.preventDefault();
		});
		addrContent.on('click',function(event){
			onFocusDiv.removeClass('focus');
			onFocusDiv=$(event.target);
			$(event.target).addClass('focus');
			onFocusDivParent=$(event.target).parent();
		});

		// addrContent.click( funcClick(event));
	});

	addSpot.click(function(){
		var addSpotText=$('#addSpotText').val();
		var spot=$("<div></div>");
		spot.text(addSpotText);
		spot.addClass('spot');
		spot.attr('id',ID);
		backStack.push(ID);
		backHash[ID]="add";
		ID=ID+1;
		

		spot.on('click',function(event){
			onFocusDiv.removeClass('focus');
			onFocusDiv=$(event.target);
			$(event.target).addClass('focus');
			onFocusDivParent=$(event.target).parent();
		});

		onFocusDivParent.append(spot);
	});

	addTraffic.click(function(){
		// alert($('div .spot').last().text());
		var addTrafficText=$('#addTrafficText').val(); 
		var traffic=$("<div></div>")
		traffic.text(addTrafficText);
		traffic.addClass('traffic');
		traffic.attr('id',ID);
		backStack.push(ID);
		backHash[ID]="add";
		ID=ID+1;

		traffic.on('click',function(event){
			onFocusDiv.removeClass('focus');
			onFocusDiv=$(event.target);
			$(event.target).addClass('focus');
			onFocusDivParent=$(event.target).parent();
		});

		onFocusDiv.after(traffic);
		// onFocusDivParent.append(traffic);
	});

	deleteDiv.on('click',function(event){
			onFocusDiv.addClass('deleteDiv');
			backHash[onFocusDiv.attr("id")]="delete";
			backStack.push(onFocusDiv.attr("id"));
			// onFocusDiv.remove();
	});

	back.on('click',function(event){
		var opId=backStack.pop();
		if(backHash[opId]=="delete"){
			$("#"+opId).removeClass('deleteDiv');
			backHash[opId]=="add";
		}else if(backHash[opId]=="add")
			$("#"+opId).addClass('deleteDiv');
			backHash[opId]=="delete";
	});

	save.on('click',function(event){
			// onFocusDiv.addClass('deleteDiv');
			var addrStr=[];
			var Str=[];
			$('div').filter(".content").each(function(i,n){

				var addrThis='';
				var spotStrThis=[];
				addrThis=$(n).children().eq(0).text();
				addrStr.push(addrThis);
				$(n).find("div").each(function(spotI,spotN){

					var spotClass=$(spotN).attr("class");
					if(spotClass=="addr"){
						addrThis=$(spotN).text();
						addrStr.push(addrThis);
					}
					if(spotClass=="spot"){

						var spotJson='{"spot":"'+$(spotN).text()+'"}';
						spotStrThis.push(spotJson);
					}else if(spotClass=="traffic"){

						var spotJson='{"traffic":"'+$(spotN).text()+'"}';
						spotStrThis.push(spotJson);
					}
					
				});

				var addrStrThis='"'+addrThis+'":['+spotStrThis.toString()+']';
				Str.push(addrStrThis);

			});

			var jsonStr='{'+Str.toString()+'}';
			// var jsonStr='{"a":[{"traffic":"c"},{"spot":"b"}]}';
			// var txt = '{{"employees":[{"firstName":"John","lastName":"Doe" },{"firstName":"Anna","lastName":"Smith" },{"firstName":"Peter","lastName":"Jones" }]}';
			$('#jsonStr').val(jsonStr);
			var obj = eval ("(" + jsonStr + ")");
			//var res=JSON.parse(employees);
			var resStr=obj.a[1].spot;
			// alert(resStr);
			 //var resStr=res[0].a[1].spot;
			// alert(resStr);
			// $.ajax({
				// 			url: "jsonRes.jsp",
				// 			data: "jsonStr="+jsonStr,
				// 			type: 'post',
				// 			dataType: 'json',
				// 			success: function(msg) {
				// 					window.location.href="jsonRes.jsp";
				// 			},
				// 			error: function(XMLHttpRequest,textStatus,error) {
								
				// 				alert(error);
				// 			}
				// 		});
				//$.post("jsonRes.jsp",{"jsonStr":jsonStr},
				  //	function(data,status){
				  //  alert("Data: " + data + "nStatus: " + status);
			 // });
			// $('#res').text(jsonStr);
			// alert(jsonStr)
			
	});


	//拖动效果
	function allowDrop(ev)
		{
		ev.preventDefault();
		}

	function drag(ev)
	{
		alert(ev.target.id);
		ev.dataTransfer.setData("Text",ev.target.id);

	}
	function drop(ev)
		{
		ev.preventDefault();
		var data=ev.dataTransfer.getData("Text");
		ev.target.appendChild(document.getElementById(data));
		}
</script>
</html>