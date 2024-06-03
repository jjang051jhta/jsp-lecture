package com.jjang051.mybatis.controller.member;

import com.jjang051.mybatis.dao.MemberDao;
import com.jjang051.mybatis.dto.MemberDto;
import com.jjang051.mybatis.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@WebServlet("/member/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/login.jsp")
                .forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDto memberDto = MemberDto
                .builder()
                .userID(req.getParameter("userID"))
                .build();
        MemberDao memberDao = new MemberDao();
        MemberDto loginMemberDto = memberDao.loginMember(memberDto);
        if(loginMemberDto!=null){
            System.out.println("login success");
            String encodedPassword = loginMemberDto.getUserPW();// 암호화된 비밀번호
            if(BCrypt.checkpw(req.getParameter("userPW"),encodedPassword)) {
                HttpSession session = req.getSession();
                session.setAttribute("sessionID",loginMemberDto.getUserID());
                session.setAttribute("sessionName",loginMemberDto.getUserName());
                session.setAttribute("profile",loginMemberDto.getRenameProfile());
                ScriptWriter.alertAndNext(resp,"로그인 되었습니다.","../index/index");
            }
        }else {
            ScriptWriter.alertAndBack(resp,
                    "알 수 없는 오류가 발생되었습니다. 잠시 후 다시 시도해 주세요.");
            System.out.println("login fail");
        }
    }
}
