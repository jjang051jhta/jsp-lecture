package com.jjang051.mybatis.controller.member;

import com.jjang051.mybatis.dao.MemberDao;
import com.jjang051.mybatis.dto.MemberDto;
import com.jjang051.mybatis.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;

@MultipartConfig
@WebServlet("/member/insert")
public class InsertMember extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/member/insert.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userPW =  req.getParameter("userPw");
        String salt = BCrypt.gensalt();
        String hashUserPW = BCrypt.hashpw(userPW,salt);
        MemberDto memberDto =
                MemberDto.builder()
                        .userID(req.getParameter("userID"))
                        .userPW(hashUserPW)
                        .userName(req.getParameter("userName"))
                        .userEmail(req.getParameter("userEmail"))
                        .postCode(Integer.parseInt(req.getParameter("postCode")))
                        .address(req.getParameter("address"))
                        .addressDetail(req.getParameter("addressDetail"))
                        .birth(req.getParameter("birth"))
                        .grade("member")
                        .originalProfile("")
                        .renameProfile("")
                        .build();
        MemberDao memberDao = new MemberDao();
        int result = memberDao.insertMember(memberDto);
        if(result>0){
            ScriptWriter.alertAndNext(resp,"회원가입되었습니다.","../index/index");
        } else {
            ScriptWriter.alertAndBack(resp,"알 수 없는 오류가 발생되었습니다. 잠시후 다시 시도해 주세요.");
        }
    }
}
