<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录_中国常宁航空</title>
</head>
<style>
	.dl_bg{
		width: 1500px;
		height: 800px;
		align: center;
	}
	.dl_ds{
		width: 400px;
		height: 300px;
		border: 5px solid #EEEEEE;
		/*让div水平居中*/
		margin: auto;
		align: center;
	}
	#dl{
		font-size: 40px;
		color: #263C62;
		font-family: "DejaVu Sans Mono";
	}
	.dl_left{
		width: 80px;
		text-align: right;
		height: 45px;
	}
	.dl_right{
		padding-left: 50px ;
	}
	#btn_sub1{
		width: 150px;
		height: 40px;
		background-color: #DC143C;
		border: 1px solid #FFD026 ;
		color: white;
		font-size: 18px;
	}
	#phone,#pwd{
		width: 180px;
		height: 25px;
		border: 1px solid #A6A6A6 ;
		/*设置边框圆角*/
		border-radius: 5px;
		padding-left: 10px;
	}

</style>
<body style="background-color:#F6F6F6;">
	<table style="margin: 0;width:100%;background-color:#F6F6F6" >
		<!-- 第一行 标志 -->
		<tr>
			<td>
				<table>
					<td width="30%">
						<img src="img/tb1.png">
					</td>
					<td align="left">
						<span id="dl">登&nbsp;&nbsp;录</span>
					</td>
				</table>
			</td>
		</tr>
		<!-- 第二行 主体 -->
		<tr>
			<td style="background-image:url(img/dlds.jpg);" >
				<div class="dl_bg">
					<div style="float: top;height: 200px">&nbsp;</div>
					<div class="dl_ds">
						<div style="float: top;height: 70px">&nbsp;</div>
						<div align="center">
							<form name="form_login" action="loginServlet" method="post">
								<table style="text-align: center">
									<tr><td class="dl_left">手机号码</td><td class="dl_right"><input type="text" name="phone" id="phone"></td></tr>
									<tr><td class="dl_left">密&nbsp;&nbsp;码</td><td class="dl_right"><input type="password" name="pwd" id="pwd"></td></tr>
									<tr><td colspan="2" align="center"><input type="submit" id="btn_sub1" value="登&nbsp;&nbsp;录"></td></tr>
								</table>
							</form>
							<p>还没有账号？<a href="regiset.jsp">注册</a></p>
						</div >

						</div>
					</div>
			</td>
		</tr>
		<!-- 第三行 底注 -->
		<tr>
			<td width="100%" align="center" bgcolor="#263C62" height="40">
				<font color="white" size="2">
					中国常宁航空股份有限公司
					版权所有Copyright 2006-2021&copy;, All Rights Reserved 苏ICP备18888888
				</font>
			</td>
		</tr>
	</table>
</body>
</html>
