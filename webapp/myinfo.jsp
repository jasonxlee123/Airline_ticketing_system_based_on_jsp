<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" import="com.db.dbconn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的账户_中国常宁航空</title>
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
    .btn_cx {
        width: 140px;
        height: 36px;
        background-color: #DC143C;
        border: 1px solid #FFD026;
        color: white;
        font-size: 18px;
    }
    .xxds{
        background-color: white;
        width: 400px;
        height: 400px;
        border: 8px solid #EEEEEE;
        text-align: center;
        margin-left: 15%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .xxbg{

        align: center;
    }
    #dl{
        font-size: 40px;
        color: #263C62;
        font-family: "DejaVu Sans Mono";
    }
    .dl_left{
        width: 80px;
        text-align: left;
        height: 45px;
    }
    .dl_right{
        width: 100px;
        text-align: left;
        height: 45px;
    }
    #btn_sub1{
        width: 150px;
        height: 40px;
        background-color: #DC143C;
        border: 1px solid #FFD026 ;
        color: white;
        font-size: 18px;
    }
    #line3{
        width: 1500px;
        height: 600px;
        background-image: url("img/wdzh.jpg");
        background-size: cover;
        background-attachment: fixed;
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
<body style="background-color:#F6F6F6;">

<%
    //获取登录用户电话
    request.setCharacterEncoding("utf-8");
    String vip_phone = "游客";
    String get_num="";

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
                    <td width="5%">
                        登&nbsp;&nbsp;录
                    </td>
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
                    <td><a href="myorder.jsp">我的订单</a></td>
                    <td class="choose">我的账户</td>
                    <td><a href="index.jsp">公开信息</a></td>
                </tr>
            </table>
        </td>
    </tr>
    <!-- 第三行 我的信息 -->
    <%
        Connection con=dbconn.getDBconnection();
        String s="select * from vip where vip_phone = ?";
        PreparedStatement prepStmt = con.prepareStatement(s,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        prepStmt.setString(1,vip_phone);
        ResultSet rs = prepStmt.executeQuery();
        rs.last();
    %>


    <tr><td style="font-size:30px">我的信息</td></tr>
    <tr>
        <td id="line3">
            <div class="xxds">
                <table class="xxbg">
                    <% rs.beforeFirst(); //移至第一条记录之前
                        while(rs.next()){
                    %>
                    <tr><td class="dl_left">姓名:</td><td class="dl_right"><%= rs.getString("vip_name") %></td></tr>
                    <tr><td class="dl_left">性别:</td><td class="dl_right"><%= rs.getString("vip_sex") %></td></tr>
                    <tr><td class="dl_left">出生日期:</td><td class="dl_right"><%= rs.getString("vip_birth") %></td></tr>
                    <tr><td class="dl_left">电话:</td><td class="dl_right"><%= rs.getString("vip_phone") %></td></tr>
                    <tr><td class="dl_left">身份证号:</td><td class="dl_right"><%= rs.getString("vip_id") %></td></tr>
                    <tr><td colspan="2" align="center"><input type="submit" class="btn_cx" value="修&nbsp;&nbsp;改"></td></tr>
                    <% get_num=rs.getString("vip_num");
                        }%>
                </table>
            </div>
        </td>
    </tr>
<%

%>
    <!-- 第四行 乘客信息 -->
    <%
        String s1 = "select * from passager where vip_num = ?";
        prepStmt = con.prepareStatement(s1,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        prepStmt.setString(1,get_num);
        rs = prepStmt.executeQuery();
        rs.last();
    %>
    <tr><td style="font-size:30px">乘客信息</td></tr>
    <tr>
        <td>
            <div align="center">
                <form>
                    <div class="ckxxbkj">
                        <table>
                            <tr class="ckxxb">
                                <th><input type="checkbox" name="xz"></th><th>姓名</th><th>身份证号码</th><th>联系电话</th>
                            </tr>
                            <% rs.beforeFirst(); //移至第一条记录之前
                                while(rs.next()){
                            %>
                            <tr  class="ckxxbjth">
                                <td><input type="checkbox" name="xz"></td><td><%= rs.getString(3) %></td><td><%= rs.getString(4) %></td><td><%= rs.getString(5) %></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <input type="submit" class="btn_cx" value="添加乘客">
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