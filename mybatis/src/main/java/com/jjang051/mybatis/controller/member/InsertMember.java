package com.jjang051.mybatis.controller.member;

import com.jjang051.mybatis.dao.MemberDao;
import com.jjang051.mybatis.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/member/insert")
public class InsertMember extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MemberDto memberDto =
                MemberDto.builder()

                        .build();
        MemberDao memberDao = new MemberDao();
        int result = memberDao.insertMember(memberDto);
    }
}
