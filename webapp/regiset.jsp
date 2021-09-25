<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册_中国常宁航空</title>
</head>
<style>
	.dl_bg{
		width: 1500px;
		height: 800px;
		align: center;
	}
	.dl_ds{
		width: 400px;
		height: 600px;
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

</style>

<script>
	function check(){

		if(form1.pwd.value.length<6){
			alert("密码必须大于6位！");
			form1.pwd.focus();
			return false;
		}
		if(form1.pwd.value!=form1.confirm.value){
			alert("两次密码必须一致！");
			form1.pwd.focus();
			return false;
		}
		return true;
	}

</script>

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
					<span id="dl">注&nbsp;&nbsp;册</span>
				</td>
			</table>
		</td>
	</tr>
	<!-- 第二行 主体 -->
	<tr>
		<td style="background-image:url(img/dlds.jpg);" >
			<div class="dl_bg">
				<div style="float: top;height: 100px">&nbsp;</div>
				<div class="dl_ds">
					<div style="float: top;height: 70px">&nbsp;</div>
					<div align="center">
						<form name="form1" action="regisetServlet" method="get">
							<table style="text-align: center">
								<tr><td class="dl_left">姓名:</td><td class="dl_right"><input type="text" name="name" required></td></tr>
								<tr><td class="dl_left">性别:</td><td class="dl_right"><input type="radio" name="sex" value="男" checked>男&nbsp;&nbsp;&nbsp;
																						<input type="radio" name="sex" value="女">女</td></tr>
								<tr><td class="dl_left">出生日期:</td><td class="dl_right"><input type="date" name="year" value="1990-01-01"></td></tr>
								<tr><td class="dl_left">电话:</td><td class="dl_right"><input type="text" name="phone" required></td></tr>
								<tr><td class="dl_left">身份证号:</td><td class="dl_right"><input type="text" name="id" required></td></tr>
								<tr><td class="dl_left">密码:</td><td class="dl_right"><input type="password" name="pwd" required></td></tr>
								<tr><td class="dl_left">确认密码:</td><td class="dl_right"><input type="password" name="confirm" required /></td></tr>
								<tr><td><input type="checkbox" name="md" value="yhxk">同意</td><td>请阅读<a href=""><i>用户许可协议</i></a></td></tr>
								<tr><td colspan="2" align="center"><input type="submit" id="btn_sub1" value="注&nbsp;&nbsp;册" onclick="check()"></td></tr>
							</table>
						</form>
						<p>已有账号？<a href="login.jsp">登录</a></p>
					</div >
				</div>
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
