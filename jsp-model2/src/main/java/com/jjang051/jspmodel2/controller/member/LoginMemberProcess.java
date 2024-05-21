package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.MemberDto;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/login-member-process")
public class LoginMemberProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        String userPW = req.getParameter("userPW");
        MemberDao loginMembderDao = new MemberDao();
        MemberDto logingMemberDto = loginMembderDao.loginMember(userID,userPW);
        if(logingMemberDto!=null) {
            HttpSession session = req.getSession();
            /*session.setAttribute("loggedId",logingMemberDto.getUserID());
            session.setAttribute("loggedName",logingMemberDto.getUserName());*/
            session.setAttribute("sessionMemberDto",logingMemberDto);
            resp.sendRedirect("../index/index");
        } else {
            ScriptWriter.alertAndBack(resp, "아이디 패스워드 확인해 주세요.");
        }
    }
}








