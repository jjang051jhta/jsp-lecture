package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.MemberDto;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/member/password-change")
public class PasswordChange extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/member/password-change.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String newPW = req.getParameter("newPW");
        String oldPW = req.getParameter("oldPW");
        String userID = req.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        MemberDto memberDto = memberDao.loginMember(userID,oldPW);

        if(memberDto!=null) {
            //1. 기존비밀번호가 맞는지 확인  select
            //2. 새로운 비밀번호로 바꿔주기  update
            MemberDao updateMemberDao = new MemberDao();
            int result = updateMemberDao.changedPassword(userID, newPW); //1,0
            if(result>0) {
                HttpSession session = req.getSession();
                session.invalidate();
                ScriptWriter
        .alertAndNext(resp,"비밀번호가 변경 되었습니다.","../member/login");
            } else {
                ScriptWriter
        .alertAndBack(resp,"알 수 없는 오류가 발생되었습니다. 잠시 후 다시 시도해 주세요.");
            }
        } else {
            ScriptWriter
            .alertAndBack(resp,"아이디 패스워드 확인해 주세요.");
        }
    }
}
