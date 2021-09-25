package com.servlet;

import com.dao.NavigationDAO;
import com.domain.Navigation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "searchServlet", value = "/searchServlet")
public class searchServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String cfd=request.getParameter("cfd");
        String mdd=request.getParameter("mdd");
        String cfrq=request.getParameter("cfrq");

//调用DAO实现数据库操作
        NavigationDAO naviDAO = new NavigationDAO();
        List<Navigation> navi = new ArrayList<Navigation>();
        List<Navigation> res = new ArrayList<Navigation>();
        try {
            navi = naviDAO.findAll();
        }catch(Exception e) {e.printStackTrace();}

        for(Navigation nv:navi) {
            System.out.println(nv.getDeparture());
            if(!cfd.equals("")) {
                if(nv.getDeparture()!=cfd)
                    continue;
            }
            if(!mdd.equals("")) {
                if(nv.getDestination()!=mdd)
                    continue;
            }
//            if(!cfrq.equals("")) {
//                if(nv.getTakeoff_time()!=cfrq)
//                    continue;
//            }
            res.add(nv);
        }
        request.setAttribute("update", res);
        request.getRequestDispatcher("search.jsp").forward(request,response);
    }
}
