<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.db.dbconn" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询机票_中国常宁航空</title>
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
    .choose{
        font-size: 25px;
    }
    #line3{
        width: 1500px;
        height: 500px;
        background-image: url("img/wddd.jpg");
        background-size: cover;
        background-attachment: fixed;
    }
    .jgjz{
        display: flex;
        align-items: center;
        justify-content: center;
    }
    #jgbkj{
        border: 3px solid #00FFFF;
        text-align: center;
    }
    .jgbt{
        height: 40px;
        border:3px solid #00FFFF;
        background-color: #FFD026;

    }
    .srk{
        width: 250px;
        height: 32px;
        border: 1px solid #A6A6A6 ;
        /*设置边框圆角*/
        border-radius: 5px;
        padding-left: 10px;
    }
    .srkmz{
        width: 300px;
        font-size: 20px;
        color: #101010;
    }
    #btn_cx{
        width: 150px;
        height: 40px;
        background-color: #DC143C;
        border: 1px solid #FFD026 ;
        color: white;
        font-size: 18px;
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
                    <td><a href="search.jsp">查询机票</a></td>
                    <td class="choose">我的订单</td>
                    <td><a href="myinfo.jsp">我的账户</a></td>
                    <td><a href="index.jsp">公开信息</a></td>
                </tr>
            </table>
        </td>
    </tr>
    <!-- 第三行 查询条件 -->
    <tr>
        <td id="line3">
            <div>
                <form action="myorder.jsp" method="post">
                    <table style="border:10px #000000;width:500px;height:500px;">
                        <tr><td class="srkmz">出发城市</td><td class="srkmz">航&nbsp;&nbsp;班</td></tr>
                        <tr><td><input type="text" name="cfd" class="srk" value=""></td><td><input type="text" name="hb" class="srk" value=""></td></tr>
                        <tr><td class="srkmz">抵达城市</td><td class="srkmz">乘&nbsp;&nbsp;客</td></tr>
                        <tr><td><input type="text" name="mdd" class="srk" value=""></td><td><input type="text" name="ck" class="srk" value=""></td></tr>
                        <tr><td class="srkmz">出发日期</td><td class="srkmz">下单日期</td></tr>
                        <tr><td><input type="date" name="cfrq" class="srk" value="2021-10-10"/></td><td><input type="date" name="od" class="srk" value="2021-10-10"></td></tr>
                        <tr><td colspan="2" ><input type="submit" id="btn_cx" value="查&nbsp;&nbsp;询" name="submit"></td></tr>
                    </table>
                </form>
            </div>
        </td>
    </tr>
    <!-- 第四行 查询结果 -->
    <tr><td style="font-size:30px">查询结果</td></tr>
    <%
        request.setCharacterEncoding("UTF-8");
        String submit=request.getParameter("submit");
        Connection con= dbconn.getDBconnection();
        PreparedStatement prepStmt=null;
        ResultSet rs=null;

        String sql= "" +
            "select " +
            "order_day, navigation.flight_num, departure, destination, navigation.takeoff_time, pass_name " +
            "from " +
            "myorder, flight, passager, navigation ,vip " +
            "where  vip.vip_phone=? " +
            "and myorder.vip_num = vip.vip_num " +
            "and myorder.pass_num = passager.pass_num " +
            "and myorder.navi_num = navigation.navi_num " +
            "and navigation.flight_num = flight.flight_num ";

        if(submit!=null&&!submit.equals("")) {
            String  cfd=request.getParameter("cfd");
            String  mdd=request.getParameter("mdd");
            String  cfrq=request.getParameter("cfrq");
            String  hb=request.getParameter("hb");
            String  ck=request.getParameter("ck");
            if(cfd!=""){
                sql = sql +"and flight.departure = '" + cfd + "' ";
            }

            if(mdd!=""){
                sql = sql +"and flight.destination = '" + mdd + "' ";
            }

            if(cfrq!=""){
                sql = sql +"and navigation.takeoff_time like '" + cfrq + "%' ";
            }

            if(hb!=""){
                sql = sql +"and flight.num = '" + hb + "' ";
            }

            if(ck!=""){
                sql = sql +"and passager.pass_name = '" + ck + "' ";
            }
            System.out.println(sql);
        }
        prepStmt = con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        //prepStmt.setString(1,cfd);
        prepStmt.setString(1,vip_phone);
        rs = prepStmt.executeQuery();
        rs.last();
    %>
    <tr>
        <td>
            <div class="jgjz">
                <table id="jgbkj">
                    <tr class="jgbt">
                        <td style="width: 200px">下单时间</td>
                        <td style="width: 100px">航班</td>
                        <td style="width: 100px">出发城市</td>
                        <td style="width: 100px">抵达城市</td>
                        <td style="width: 100px">起飞时间</td>
                        <td style="width: 100px">乘客</td>
                        <td style="width: 100px">状态</td>
                        <td style="width: 50px">操作</td>
                    </tr>
                    <% if(rs!=null){
                        rs.beforeFirst(); //移至第一条记录之前
                        while(rs.next()){
                            String xdrq = rs.getString(1);
                    %>
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(3)%></td>
                        <td><%=rs.getString(4)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td>已下单</td>
                        <td><a href='cancelServlet?flight_num=<%=xdrq%>'>退票</a></td>
                    </tr>
                    <%}}%>
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