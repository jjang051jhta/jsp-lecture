package com.jjang051.jspmodel2.controller.member;

import com.google.gson.Gson;
import com.jjang051.jspmodel2.dao.MemberDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/delete-ajax")
public class AdminDeleteMember extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        int result = memberDao.deleteMember(userID);
        Map<String,String> resultMap = new HashMap<>();
        if(result>0) {
            resultMap.put("isDelete","yes");
        } else {
            resultMap.put("isDelete","no");
        }
        Gson gson = new Gson(); //자바 객체를 json변환해 준다.
                                //json 자바 객체로도 변환해준다.
        String resultJSon = gson.toJson(resultMap);
        /*req.setAttribute("resultJSon",resultJSon);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/member/jfkfdks.jsp");*/

        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json; charset=UTF-8");
        out.println(resultJSon);
    }
}
