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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/id-check-process")
public class IdCheckProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        int result = memberDao.checkDuplicateId(userID); //0 or 1
        Gson gson = new Gson();
        Map<String , Integer> countMap  = new HashMap<>();
        countMap.put("count",result);
        String json = gson.toJson(countMap);
        req.setAttribute("json",json); // jsp로 데이터 내려보내기
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/member/id-check.jsp");
        dispatcher.forward(req,resp);
    }
}
