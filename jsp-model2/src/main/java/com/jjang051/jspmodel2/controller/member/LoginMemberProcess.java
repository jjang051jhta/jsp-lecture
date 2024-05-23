package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.MemberDto;
import com.jjang051.jspmodel2.utils.CookieManager;
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
        String saveID = req.getParameter("saveID");

        MemberDao loginMemberDao = new MemberDao();
        MemberDto loginMemberDto = loginMemberDao.loginMember(userID,userPW);
        if(loginMemberDto!=null) {
            HttpSession session = req.getSession();
            /*session.setAttribute("loggedId",logingMemberDto.getUserID());
            session.setAttribute("loggedName",logingMemberDto.getUserName());*/
            session.setAttribute("sessionMemberDto",loginMemberDto);
            //pageContent, request, session, application
            if(saveID!=null && saveID.equals("yes")) {
                CookieManager
              .createCookie(resp,"loggedID",userID,60*60*24*365);
            } else {
                CookieManager
              .deleteCookie(resp,"loggedID"); //시간 설정을 0으로 하기
            }
            resp.sendRedirect("../index/index");
        } else {
            ScriptWriter.alertAndBack(resp, "아이디 패스워드 확인해 주세요.");
        }
    }
}








