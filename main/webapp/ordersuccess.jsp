<%--
  Created by IntelliJ IDEA.
  User: Jason.X.LEE
  Date: 9/18/2021
  Time: 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订购成功</title>
</head>
<style>
    p{
        text-align: center;
    }
    span{
        color:red;
    }

</style>
<body>
<p>
    订购成功！<span id="time">5</span>秒后自动跳转...
</p>
</body>

<script>
    var second = 5;
    var time = document.getElementById("time");

    function showTime(){
        second -- ;
        if(second <= 0){
            location.href = "myorder.jsp";
        }

        time.innerHTML = second +"";
    }
    setInterval(showTime,1000);

</script>
</html>
