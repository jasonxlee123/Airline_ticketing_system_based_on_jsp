<%@ page contentType="text/html;charset=UTF-8" language="java"
		 import="java.sql.*" import="com.db.dbconn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎访问_中国常宁航空公司_官方网站</title>
</head>

<style>
.srk {
	width: 250px;
	height: 32px;
	border: 1px solid #A6A6A6;
	/*设置边框圆角*/
	border-radius: 5px;
	padding-left: 10px;
}

.srkmz {
	font-size: 20px;
	color: #101010;
}

#btn_cx {
	width: 150px;
	height: 40px;
	background-color: #DC143C;
	border: 1px solid #FFD026;
	color: white;
	font-size: 18px;
}

#line1 {
	width: 100%;
	text-align: center;
	background-color: #263C62;
	color: white;
}

#maintable {
	width: 700px;
	height: auto;
	cellspacing: 10px;
	margin: 10px;
	text-align: center
}

.xxb{
	width: 680px;
	background-color: white;
	border: 3px solid #E0FFFF;
	border-radius: 5px;
}
.xxbout{
	width: 680px;
	background-color: white;
	border: 3px solid #E0FFFF;
	border-radius: 5px;
}
.xxb1{
	color: #666666;
	font-size: 8px;
	padding-left: 5px;
}
.table1{
	color: darkblue;
	font-size: 10px;
	padding-left: 10px;
}
.fg1{
	width: 90px;
	height:70px;
	text-align: center;
}
.fg2{
	width: 75px;
	height: 50px;
	text-align: center;
	font-size: 18px;
}
.fg3{
	text-align: center;
}
.fg4{
	text-align: left;
	padding-left: 20px;
	font-size: 10px;
	color: darkblue;
}
.fg5{
	text-align: right;
	padding-right: 20px;
	font-size: 10px;
	color: darkblue;
}

.choose {
	font-size: 25px;
}

a {
	text-decoration: none
}

a:hover {
	text-decoration: none
}
</style>

<script type="text/javascript"></script>

<body style="background-color: #F6F6F6;">

<%
	//获取登录用户电话
	request.setCharacterEncoding("utf-8");
	String vip_phone = "游客";

	Cookie[] cookies = request.getCookies();
	//保存有cookie对象
	if (cookies != null && cookies.length > 0) {
		for (Cookie c : cookies) {
			if (c.getName().equals("vip_phone")) {
				vip_phone = c.getValue();
			}
		}
	}
%>

	<table width="100%" align="center">
		<!-- 第一行 热线和注册登录 -->
		<tr>
			<td>
				<table id="line1">
					<tr bgcolor="#263C62">
						<td width="15%">热线：888 888 8888</td>
						<td width="60%">&nbsp;</td>
						<td width="20%">你好！<%=vip_phone%></td>
						<td width="5%"><a href="login.jsp">登&nbsp;&nbsp;录</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 第二行 标志和主要选项 -->
		<tr>
			<td>

				<table style="background-color: #F6F6F6; width: 100%;">
					<tr>
						<td style="width: 30%;"><img src="img/tb1.png"></td>
						<td class="choose">首&nbsp;&nbsp;&nbsp;&nbsp;页</td>
						<td><a href="search.jsp">查询机票</a></td>
						<td><a href="myorder.jsp">我的订单</a></td>
						<td><a href="myinfo.jsp">我的信息</a></td>
						<td><a href="index.jsp">公开信息</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<!-- 第三行 查找航班 -->
		<tr>
			<td style="font-size: 30px">查找航班</td>
		</tr>
		<tr>
			<td style="background-image: url(img/czhb.jpg);">
				<div style="float: left; width: 30%;">&nbsp;</div>
				<div style="float: left;">
					<form action="search.jsp" method="post" name="cx1">
						<table style="border: 10px #000000; width: 500px; height: 500px;">
							<tr>
								<td class="srkmz">出发城市</td>
							</tr>
							<tr>
								<td><input type="text" name="cfd" class="srk" value=""></td>
							</tr>
							<tr>
								<td class="srkmz">抵达城市</td>
							</tr>
							<tr>
								<td><input type="text" name="mdd" class="srk" value=""></td>
							</tr>
							<tr>
								<td class="srkmz">出发日期</td>
							</tr>
							<tr>
								<td><input type="date" name="cfrq" class="srk"
									value="2021-9-18" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" id="btn_cx"
									value="查&nbsp;&nbsp;询" name="submit"></td>
							</tr>
						</table>
					</form>
				</div>
			</td>
		</tr>
		<!-- 第四行 每日航班信息 -->
		<%
			Connection con=dbconn.getDBconnection();
			String s="select navigation.flight_num,airplane.aircraft_type,flight.departure,flight.destination,flight.takeoff_time,flight.arrival_time,navigation.ticket_price,navigation.rest_tickets\r\n"
					+ "from navigation,flight,airplane\r\n"
					+ "where navigation.flight_num = flight.flight_num and flight.aircraft_num = airplane.aircraft_num;";
			PreparedStatement prepStmt = con.prepareStatement(s,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = prepStmt.executeQuery();
			rs.last();
		%>

		<tr>
			<td style="font-size: 30px">今日航班</td>
		</tr>
		<tr>
			<td>
				<div style="float: left; width: 30%">&nbsp;</div>
				<div></div>
				<table class="xxb" id="maintable">
					<% rs.beforeFirst(); //移至第一条记录之前
						while(rs.next()){
							String hbh = rs.getString(1);
					%>
					<tr>
						<td>
							<table class="table1">
								<tr>
									<td><%= rs.getString(1) %>&nbsp;</td><td>机型：<%= rs.getString(2) %>&nbsp;</td><td>有餐食</td><td><a href='order.jsp?flight_num=<%=hbh%>'>选购</a></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table>
								<tr class="xxb1">
									<td>出发</td><td>&nbsp;</td><td>&nbsp;</td><td>抵达</td><td class="fg3">当前票价</td><td class="fg3">剩余座位</td>
								</tr>
								<tr>
									<td class="fg2"><%= rs.getString(3) %></td><td colspan="2"><img src="img/hb1.png"></td><td class="fg2"><%= rs.getString(4) %></td><td rowspan="2" class="fg1"><%= rs.getString(7) %></td><td rowspan="2" class="fg1"><%= rs.getString(8) %></td>
								</tr>
								<tr>
									<td colspan="2" class="fg4"><%= rs.getString(5) %></td><td colspan="2" class="fg5"><%= rs.getString(6) %></td>
								</tr>
							</table>
						</td>
					</tr>
					<%}%>
				</table>
				</div>
			</td>
		</tr>
		<%
			if (rs != null) {
				rs.close();
			}
			if (prepStmt != null) {
				prepStmt.close();
			}
			if (con != null) {
				con.close();
			}
		%>
		<!-- 第五行 展示滚动图 -->
		<tr>
			<td style="font-size: 30px">体验天地</td>
		</tr>
		<tr>
			<td style="border: 1px; width: 1500px; height: 500px;"><img
				id="img" src="img/lbt1.jpg" width="100%"></td>
		</tr>
		<!-- 第六行 航司信息 -->
		<tr>
			<td style="font-size: 30px">走进常航</td>
		</tr>
		<tr>
			<td
				style="width: 1500px; height: 400px; background-image: url(img/hsxx.jpg);">
				<div style="width: 30%; float: left;">
					<table style="font-size: 15px; padding: 12px; padding-left: 30px">
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;中国常宁航空股份有限公司（以下简称“常航”）总部位于上海，是中国三大国有骨干航空公司之一，
								前身可追溯到1957年1月原民航上海管理处成立的第一支飞行中队，是首家在纽约、香港、上海三地挂牌 上市的中国航企。</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;作为天合联盟成员，常航的航线网络通达全球170个国家和地区的1036个目的地，每年为全球超过1.
								3亿旅客提供服务，旅客运输量位列全球前十。旅客可享受联盟19家航空公司的会员权益及全球超过790间机场贵宾室。</td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;常航的机队规模达730余架，是全球规模航企中最年轻的机队之一，拥有中国规模最大、商业和技术模
								式领先的互联网宽体机队。常航在国内拥有京沪“两市四场”双核心枢纽和西安、昆明等区域枢纽，业务范围
								实现省会城市及千万级以上机场的全覆盖，并在全球设有111个海内外分支机构。公司近年来开通多条“一带
								一路”国际新航线，积极构建连通全球的“空中丝绸之路”。</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<!-- 第七行 其他信息 -->
		<tr>

		</tr>
		<!-- 第八行 版权信息 -->
		<tr>
			<td align="center" bgcolor="##263C62" height="40"><font
				color="white" size="2"> 中国常宁航空股份有限公司 版权所有Copyright
					2006-2021&copy;, All Rights Reserved 苏ICP备18888888 </font></td>
		</tr>

	</table>

	<script>
<!-- 第五行 展示滚动图 -->
var number = 1;
function fun(){
    number ++ ;
    //判断number是否大于3
    if(number > 3){
        number = 1;
    }
    //获取img对象
    var img = document.getElementById("img");
    img.src = "img/lbt"+number+".jpg";
}
setInterval(fun,5000);


</script>


</body>
</html>
