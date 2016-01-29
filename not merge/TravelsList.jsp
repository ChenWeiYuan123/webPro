<%@ page contentType="text/html;charset=utf-8" import="com.group.MyDataBase, java.sql.*, javax.servlet.http.Cookie"%>
<% 
// JSP 代码
%>
<%!
String user = "";
//获取登录信息
private void getLoginStatus(HttpServletRequest request) {
	Cookie[] cookies = request.getCookies();
	for (Cookie cookie: cookies) {
		String name = cookie.getName();
		String value = cookie.getValue();
		if(name.equals("user")) user = value;
	}
}
%>

<%
getLoginStatus(request);
if("".equals(user)) {
	response.sendRedirect("index.jsp");
}
%>


<% 
// HTML代码
%>
<!DOCTYPE html>
<html>
<head>
	<title>TravelList</title>
	<meta charset=utf-8>
	<meta name=description content="">
	<meta name=viewport content="width=device-width, initial-scale=1">
	<link rel=stylesheet href="css/TravelsList.css">
</head>
<body>
	<div class="head">
		<div class="head-nav">
				<p>TRAVELS</p>
				<input type="text">
				<input type="button" value="Search">
				<%// 设置登录/注册按钮或显示登录用户信息 %>
				<%="".equals(user)?
					"<input type='button' id='register' value='Register'  onclick='register()'>"+
					"<input type='button' id='Login' value='Login'  onclick='login()'>":
					"<span class='user_status'><a href=\"index.jsp?action=logout\">Logout</a></span>" + 
					"<span class='user_status'>"+ "Welcome " +user+ "!</span>"%>		
				
		</div>
		<div class="head-main">
				<p>Moving</p>
				
		</div>
	</div>

	<div class="publish">
		<nobr id="nobr">

			<div class="addrNewBig height">
				<span>加尔各答</span>
			</div>
			<div class="imgBlockSmallBlockNew">
				<img width="100%" id="img20" src="img/a4.jpg" draggable="false">
				<span class="hidden">1.jpg</span>
			</div>
			<div class="inline margin">经过几个小时的飞行，我和m从曼谷来到印度的第一站：加尔各答。虽然已预先在心理打了预防针，但下飞机那一刻还是感	受到不小的落差，这里曾经作为英属印度首都，现今印度排名前列的大都会，机场却非常破旧，角落里堆积了不少垃圾，也看不到有多少工作人员的样	子，感觉和个小火车站差不多。
				Lp里描述，在印度一出机场将会受到“热烈的欢迎”，但那不是因为当地人好客，而是想骗你的钱。我们俩人生地不熟，也不知如何去背包客聚集区桑德街(SudderStreet)，不免担心被骗，所以在机场内和一位同是刚下机的西方人搭讪，一问是意大利人，叫Robertor，也是要去那里，于是就跟着他混了。走出机场，没有想象中夸张的场面，只有零星几个出租车司机问要不要乘车，但为了省钱我们决定去坐巴士。R已经第三次到印度，所以非常自然的去路边找人问路，那人也蛮热心，结果没想到才刚到就领教了印度人喜欢乱指路的毛病，车开了大半段路，发现根本不到那里= =于是在靠近市区的地方下车, 转乘一辆出租车150Rs/三人到桑德街。
			</div>
			<div class="imgBlockSmallBlockNew">
				<img width="100%" id="img21" src="img/a1.jpg" draggable="false">
				<span class="hidden">2.jpg</span>
			</div>
			<div class="inline margin">下车后便到了目的地桑德街，非常多的便宜旅馆，乞丐，还有满街弥漫的尿味。我们先看了大多数人推荐的Mariahotel，结		果一进门就闻到了一股非常浓重的消毒水味道，伙计带我们看房间，房内完好的保留了上任房客离开时的摸样：散乱的床单，被子上各种毛发，可疑		的污渍，加上那股消毒水味，我联想到了——停尸间！ 最后到旁边的MODERN LODGE住下，500Rs的风扇房有独立厕所，房间虽在旅馆的天台，但下水		道总飘出一股屎味，房内设施也非常陈旧，R表示在印度条件只能如此了。经理在楼下一直叫唤要我们去填入住资料，下楼看到他桌子上那大大本		什么都要填的表格，从哪来到哪去都要写清楚，连爸爸的名字也不放过！我们虽觉得有些可笑，但入乡随俗，在印度人的地盘只能守印度人的规矩。
			</div>

			<div class="addrNewBig height">
				<span>菩提伽耶</span>
			</div>
			<div class="imgBlockSmallBlockNew">
				<img width="100%" id="img20" src="img/a2.jpg" draggable="false">
				<span class="hidden">1.jpg</span>
			</div>
			<div class="inline margin">穿过著名的豪拉大桥，桥下便是恒河支流胡格利河（Hooghly River），豪拉火车站就位于河的旁边，资料说该车站是印度最大的火车站之一，实际看到确实很气派，来往的旅客熙熙攘攘非常热闹。到车站二楼的售票厅买票，和住宿一样在印度买火车票也要填繁复的表格，我们初来乍到花了不少时间琢磨该怎么填表，结果队伍排到我们的时候售票窗居然关闭休息了= =，听了几个印度人完全不同的指点，我们又换了几个窗口继续排队，花了几个小时的时间最后被告知这里根本无票可买，得明天再去另一个地方，真是让人哭笑不得。回到桑德街附近的Airtel办电话卡，排很久的队后被告知还必须要旅馆经理的签名，而某前辈的攻略上却着重写了Airtel办卡是不需要这些东西的，此时感到印度的随意性实在太强，凡事只能拼RP，而我们今天的运气实在太差，一直在做无用功！
			</div>
			<div class="imgBlockSmallBlockNew">
				<img width="100%" id="img21" src="img/a3.jpg" draggable="false">
				<span class="hidden">2.jpg</span>
			</div>
			<div class="inline margin">回到旅馆已是深夜，没想到天台上挤满了人，一大群人在聊天喝酒玩的不亦乐乎。我们穿过人群回房间，全身黏糊糊疲倦得想洗漱完就赶快休息了，谁知祸不单行卫生间居然没水，才第一天真不知老天还要给我们多少考验！？开门正要下楼找伙计解决问题，门外聊天的人群中有位男的站起来问他们是不是影响到我们的休息，m回答不是，是我们的房间没水了，他立马说不会吧！我帮你去问问。说完便下楼去了，我们都有些惊讶怎么会有这么热心的好人。原来是楼下的开关没有打开，问题很快就解决了，而我们也随性加入到他们聊天的队伍中。
			</div>
		</nobr>
	</div>
</body>
</html>