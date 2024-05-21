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
import java.util.List;

@WebServlet("/member/list")
public class ListMember extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //list
        MemberDao memberDao = new MemberDao();
        List<MemberDto> memberList = memberDao.listMember();
        req.setAttribute("memberList",memberList);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/member/list-member.jsp");
        dispatcher.forward(req,resp);
    }
}
