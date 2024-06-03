package com.jjang051.mybatis.controller.member;

import com.google.gson.Gson;
import com.jjang051.mybatis.dao.MemberDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/id-check")
public class IdCheck extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        int result = memberDao.idCheck(userID);
        Gson gson = new Gson();
        Map<String, Integer> resultMap = new HashMap<>();
        resultMap.put("count",result);
        String resultJson = gson.toJson(resultMap);
        resp.setContentType("application/json; charset=utf-8");
        PrintWriter out = resp.getWriter();
        out.println(resultJson);
    }
}
