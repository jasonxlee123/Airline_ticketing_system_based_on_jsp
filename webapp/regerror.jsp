<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册失败</title>
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
    注册失败！&nbsp;<span id="time">5</span>秒后自动跳转...
</p>


<script>
    var second = 5;
    var time = document.getElementById("time");

    function showTime(){
        second -- ;
        if(second <= 0){            
            location.href = "regiset.jsp";
        }

        time.innerHTML = second +"";
    }
    setInterval(showTime,1000);

</script>
</body>
</html>