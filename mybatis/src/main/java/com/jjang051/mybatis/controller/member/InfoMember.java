package com.jjang051.mybatis.controller.member;

import com.jjang051.mybatis.dao.MemberDao;
import com.jjang051.mybatis.dto.MemberDto;
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
        MemberDto memberDto = new MemberDto();
        memberDto.setUserID(userID);
        MemberDto infoMemberDto = memberDao.loginMember(memberDto);
        req.setAttribute("infoMemberDto",infoMemberDto);
        req.getRequestDispatcher("/WEB-INF/member/info.jsp")
                .forward(req,resp);
    }
}
