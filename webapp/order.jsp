<%@ page import="java.sql.*" import="com.db.dbconn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>下单页面_中国常宁航空</title>
</head>
<style>
	#line1{
		width: 100%;
		text-align: center;
		background-color: #263C62;
		color: white;
	}
	a{ text-decoration:none}
	a:hover{ text-decoration:none}
	#dl{
		font-size: 40px;
		color: #263C62;
		font-family: "DejaVu Sans Mono";
	}
	#line3{
		background-image:url(img/czhb.jpg);
		width: 1500px;
		height: 500px;
	}
	.btn_cx {
		width: 140px;
		height: 36px;
		background-color: #DC143C;
		border: 1px solid #FFD026;
		color: white;
		font-size: 18px;
	}


	.xxb{
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


	.fjt{
		width: 680px;
		height: 250px;
		border: 3px solid #E0FFFF;
		border-radius: 5px;
	}

	.ckxxbkj{
		width: 500px;
		height: 300px;
		display: flex;
		align-items: center;
		justify-content: center;
	}
	.ckxxb{
		margin: 50px;
		border: 3px solid #00FFFF;
		background-color: #EEEEEE;

	}
	.ckxxbjth{
		background-color: #E0FFFF;
		border: 2px solid #FFD026;

	}

</style>

<script>
	window.onload = function() {
		document.getElementById("firstCb").onclick = function () {
				//第一个cb点击
				//1.获取所有的checkbox
				var cbs = document.getElementsByName("xz");
				//获取第一个cb

				//2.遍历
				for (var i = 0; i < cbs.length; i++) {
					//3.设置每一个cb的状态和第一个cb的状态一样
					cbs[i].checked = this.checked;
				}
			}
	}
</script>

<body style="background-color:#F6F6F6;">
<%
	request.setCharacterEncoding("UTF-8");
	String fn=request.getParameter("flight_num");
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
	<table style="margin: 0;width:100%;background-color:#F6F6F6">
		<!-- 第一行 顶端和登录 -->
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
		<!-- 第二行 标志 -->
		<tr>
			<td>
				<table>
					<td width="30%">
						<img src="img/tb1.png">
					</td>
					<td align="left">
						<span id="dl">提交订单</span>
					</td>
				</table>
			</td>
		</tr>
		<!-- 第三行 航班信息 -->
		<%
			String xht="";
			Connection con=dbconn.getDBconnection();
			String s="select navigation.flight_num,airplane.aircraft_type,flight.departure,flight.destination,flight.takeoff_time,flight.arrival_time,navigation.ticket_price,navigation.rest_tickets\r\n"
					+ "from navigation,flight,airplane\r\n"
					+ "where navigation.flight_num=? and navigation.flight_num = flight.flight_num and flight.aircraft_num = airplane.aircraft_num;";
			PreparedStatement prepStmt = con.prepareStatement(s,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			prepStmt.setString(1,fn);
			ResultSet rs = prepStmt.executeQuery();
			rs.last();
		%>
		<tr>
			<td id="line3">
				<div align="center">
					<div>
						<table class="xxb" id="maintable">
							<% rs.beforeFirst(); //移至第一条记录之前
								while(rs.next()){
							%>
							<tr>
								<td>
									<table class="table1">
										<tr>
											<td><%= rs.getString(1) %>&nbsp;</td><td>机型：<%= rs.getString(2) %>&nbsp;</td><td>有餐食</td>
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
							<%xht = rs.getString(2);
								}%>
						</table>
					</div>
					<%
						String s1 = "select * from airplane where aircraft_type = ?";
						prepStmt = con.prepareStatement(s1,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
						prepStmt.setString(1,xht);
						rs = prepStmt.executeQuery();
						rs.last();
						rs.beforeFirst();
						rs.next();

					%>
					<div width="30px">&nbsp;</div>
					<div class="fjt">
						<img src=<%=rs.getString(2)%>>
					</div>


				</div>
			</td>
		</tr>
		<!-- 第四行 订单和提交 -->
		<%
			String s2 = "select pass_name,pass_id,pass_phone from vip,passager where vip_phone = ? and vip.vip_num=passager.pass_num";
			prepStmt = con.prepareStatement(s2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			prepStmt.setString(1,vip_phone);
			rs = prepStmt.executeQuery();
			rs.last();
		%>
		<tr><td style="font-size:30px">选择乘客</td></tr>
		<tr>
			<td>
				<div align="center">
					<form action="orderServlet" method="post" name="tjdd">
						<div class="ckxxbkj">
							<table>
								<tr class="ckxxb">
									<th><input type="checkbox" name="xzall"></th><th>姓名</th><th>身份证号码</th><th>联系电话</th>
								</tr>
								<% rs.beforeFirst(); //移至第一条记录之前
									while(rs.next()){
								%>
								<tr  class="ckxxbjth">
									<td><input type="checkbox" name="xz" value="<%= rs.getString(2) %>"></td><td><input type="text" name="name" value="<%= rs.getString(1) %>"></td><td><input type="text" name="id" value="<%= rs.getString(2) %>"></td><td><input type="text" name="pn" value="<%= rs.getString(3) %>"></td>
								</tr>
								<%}%>
							</table>
						</div>
						选定航班：<input type="text" name="xdhb" value="<%= fn %>" readonly="readonly">
						<input type="submit" class="btn_cx" value="提交订单">&nbsp;&nbsp;&nbsp;<input type="button" class="btn_cx" value="添加乘客">
					</form>
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
		<!-- 第五行 底端信息 -->
		<tr>
			<td align="center" bgcolor="##263C62" height="40px">
				<font color="white" size="2">
					中国常宁航空股份有限公司
					版权所有Copyright 2006-2021&copy;, All Rights Reserved 苏ICP备18888888
				</font>
			</td>
		</tr>
	</table>
</body>
</html>