package com.jjang051.jspmodel2.controller.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/insert")
public class InsertMember extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //super.doGet(req, resp);
        //db접속도 하고 데이터 조작도 하고....
        //m(dto)v(jsp)c(servlet)
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/member/insert-member.jsp");
        dispatcher.forward(req,resp);
        //view 파일...
    }
}
