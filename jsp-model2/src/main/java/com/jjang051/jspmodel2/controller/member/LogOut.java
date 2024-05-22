package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/logout")
public class LogOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //session종료
        HttpSession session = req.getSession();
        session.invalidate();
        ScriptWriter
                .alertAndNext(resp,"로그아웃되었습니다.","../index/index");
    }
}
