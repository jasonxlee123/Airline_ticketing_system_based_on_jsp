package com.servlet;

import com.dao.MyinfoDAO;
import com.dao.MyorderDAO;
import com.dao.NavigationDAO;
import com.dao.PassagerDAO;
import com.db.dbconn;
import com.domain.Myorder;
import com.domain.Navigation;
import com.domain.Passager;
import com.domain.Vip;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "orderServlet", value = "/orderServlet")
public class orderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String vip_phone = "";
        Cookie[] cookies = request.getCookies();
        //保存有cookie对象
        if (cookies != null && cookies.length > 0) {
            for (Cookie c : cookies) {
                if (c.getName().equals("vip_phone")) {
                    vip_phone = c.getValue();
                }
            }
        }

        String name = request.getParameter("name");
        //String id = request.getParameter("id");
        String pn = request.getParameter("pn");
        String fn = request.getParameter("xdhb");
        // 调用DAO实现数据库操作
        // IStudentDAO stuDAO = StudentDAOFactory.getStudentDAOInstance();
        MyorderDAO pDAO = new MyorderDAO();
        Myorder pa = new Myorder();
        pa.setPass_name(name);
        pa.setPass_phone(pn);
        pa.setVip_phone(vip_phone);
        pa.setFlight_num(fn);

        NavigationDAO nDAO = new NavigationDAO();
        Navigation nd = new Navigation();
        nd.setFlight_num(fn);
        try {
            nDAO.update(nd);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("sit wrong");
            request.getRequestDispatcher("ordererror.jsp").forward(request, response);
        }
        try {
            if (pDAO.create(pa) == 1) {
                System.out.println("成功");
                request.getRequestDispatcher("ordersuccess.jsp").forward(request, response);
            } else {
                System.out.println("失败");
                request.getRequestDispatcher("ordererror.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("ordererror.jsp").forward(request, response);
        }
    }
}
