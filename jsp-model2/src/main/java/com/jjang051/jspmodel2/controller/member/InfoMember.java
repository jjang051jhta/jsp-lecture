package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.MemberDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/info")
public class InfoMember extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String userID = req.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        MemberDto infoMemberDto = memberDao.infoMember(userID);
        req.setAttribute("infoMemberDto",infoMemberDto);
    RequestDispatcher dispatcher =
            req.getRequestDispatcher("/WEB-INF/member/info-member.jsp");
    dispatcher.forward(req,resp);
    }
}
