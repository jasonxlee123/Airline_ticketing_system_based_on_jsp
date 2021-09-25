package com.servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MyinfoDAO;
import com.domain.Vip;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		Vip user=new Vip();
        //获取login.jsp页面提交的账号和密码
        String phone=request.getParameter("phone");
        String password=request.getParameter("pwd");
        //测试数据
        System.out.println(phone+" "+password);
        //获取login.jsp页面提交的账号和密码设置到实体类User中
        user.setVip_name(phone);
        user.setVip_pwd(password);

        //引入数据交互层
        MyinfoDAO dao=new MyinfoDAO();
        boolean us=dao.login(user);
        System.out.println(us);
        //测试返回的值
        if(us){
            System.out.println("登录成功");
            //使用Cookies对象保存字符串
            Cookie vpCookie = new Cookie("vip_phone",phone);
            vpCookie.setMaxAge(60*5);
            response.addCookie(vpCookie);
            response.sendRedirect("loginsuccess.jsp");
        }else{
        	System.out.println("登录失败");
        	request.getRequestDispatcher("loginerror.jsp").forward(request, response);
        }

	}

}
