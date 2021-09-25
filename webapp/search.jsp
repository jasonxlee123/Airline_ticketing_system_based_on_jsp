<%@ page import="com.domain.Navigation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.db.dbconn" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查询机票_中国常宁航空</title>
</head>
<style>
    #line1 {
        width: 100%;
        text-align: center;
        background-color: #263C62;
        color: white;
    }

    a {
        text-decoration: none
    }

    a:hover {
        text-decoration: none
    }

    .choose {
        font-size: 25px;
    }

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

    #cxjm {
        background-image: url(img/cxbj.jpg);
        background-size: cover;
        background-attachment: fixed;
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
</style>
<body style="background-color:#F6F6F6;">
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
    <!-- 第二行 标志和选项 -->
    <tr>
        <td>
            <table style="background-color:#F6F6F6;width:100%;">
                <tr>
                    <td style="width:30%;"><img src="img/tb1.png"></td>
                    <td><a href="index.jsp">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></td>
                    <td class="choose">查询机票</td>
                    <td><a href="myorder.jsp">我的订单</a></td>
                    <td><a href="myinfo.jsp">我的账户</a></td>
                    <td><a href="index.jsp">公开信息</a></td>
                </tr>
            </table>
        </td>
    </tr>
    <!-- 第三行 查询条件 -->
    <tr>
        <td id="cxjm">
            <div style="float: left;width: 30%;">&nbsp;</div>
            <div style="float: left;">
                <form action="search.jsp" method="post">
                    <table style="border:10px #000000;width:500px;height:500px;">
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
                            <td><input type="date" name="cfrq" class="srk" value="2021-09-18"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" id="btn_cx" value="查&nbsp;&nbsp;询" name="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </td>
    </tr>
    <!-- 第四行 查询结果 -->
    <tr><td style="font-size:30px">在售机票</td></tr>
    <%
    request.setCharacterEncoding("UTF-8");
    String submit=request.getParameter("submit");
    Connection con= dbconn.getDBconnection();
    PreparedStatement prepStmt=null;
    ResultSet rs=null;
    String sql="select navigation.flight_num,airplane.aircraft_type,flight.departure,flight.destination,flight.takeoff_time,flight.arrival_time,navigation.ticket_price,navigation.rest_tickets "
    + "from navigation,flight,airplane "
    + "where navigation.flight_num = flight.flight_num and flight.aircraft_num = airplane.aircraft_num ";

    if(submit!=null&&!submit.equals("")) {
    String  cfd=request.getParameter("cfd");
    String  mdd=request.getParameter("mdd");
    String  cfrq=request.getParameter("cfrq");

    if(cfd!=""){
    sql = sql +"and flight.departure = '" + cfd + "' ";
    }

    if(mdd!=""){
    sql = sql +"and flight.destination = '" + mdd + "' ";
    }

    if(cfrq!=""){
    sql = sql +"and navigation.takeoff_time like '" + cfrq + "%' ";
    }

    System.out.println(sql);
    }
    prepStmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
    rs = prepStmt.executeQuery();
    rs.last();

    %>

    <tr>
        <td style="display: flex;align-items: center;justify-content: center;">
            <table class="xxb">
                <% if(rs!=null){
                    rs.beforeFirst(); //移至第一条记录之前
                    while(rs.next()){
                %>
                <tr>
                    <td>
                        <table class="table1">
                            <tr>
                                <td><%= rs.getString(1) %>&nbsp;</td>
                                <td>机型：<%= rs.getString(2) %>&nbsp;</td>
                                <td>有餐食</td>
                                <td><a href='order.jsp?flight_num=<%= rs.getString(1) %>'>选购</a></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr class="xxb1">
                                <td>出发</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>抵达</td>
                                <td class="fg3">当前票价</td>
                                <td class="fg3">剩余座位</td>
                            </tr>
                            <tr>
                                <td class="fg2"><%= rs.getString(3) %>
                                </td>
                                <td colspan="2"><img src="img/hb1.png"></td>
                                <td class="fg2"><%=rs.getString(4)%>
                                </td>
                                <td rowspan="2" class="fg1"><%= rs.getString(7) %>
                                </td>
                                <td rowspan="2" class="fg1"><%= rs.getString(8) %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="fg4"><%= rs.getString(5) %>
                                </td>
                                <td colspan="2" class="fg5"><%= rs.getString(6) %>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%}}%>
            </table>
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