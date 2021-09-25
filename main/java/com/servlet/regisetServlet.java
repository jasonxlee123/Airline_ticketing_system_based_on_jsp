package com.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MyinfoDAO;

import com.domain.Vip;

/**
 * Servlet implementation class regisetServlet
 */
@WebServlet("/regisetServlet")
public class regisetServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public regisetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Servlet#init(ServletConfig)
     */
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
    }

    /**
     * @see Servlet#destroy()
     */
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String birthday = request.getParameter("year");
        String phone = request.getParameter("phone");
        String id = request.getParameter("id");
        String password = request.getParameter("pwd");
        // 调用DAO实现数据库操作
        // IStudentDAO stuDAO = StudentDAOFactory.getStudentDAOInstance();
        MyinfoDAO miDAO = new MyinfoDAO();
        Vip vip = new Vip();
        vip.setVip_name(name);
        vip.setVip_sex(sex);
        vip.setVip_birth(birthday);
        vip.setVip_phone(phone);
        vip.setVip_id(id);
        vip.setVip_pwd(password);
        try {
            if (miDAO.create(vip) == 1) {
                System.out.println("成功");
                request.getRequestDispatcher("regsuccess.jsp").forward(request, response);
            } else {
                System.out.println("失败");
                request.getRequestDispatcher("regerror.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("regerror.jsp").forward(request, response);
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }


}
