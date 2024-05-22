package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.MemberDto;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/member/insert-process")
public class InsertMemberProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        String userPW = req.getParameter("userPW"); //1234
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        Integer postCode = Integer.parseInt(req.getParameter("postCode"));
        String address = req.getParameter("address");
        String detailAddress = req.getParameter("detailAddress");
        String birth = req.getParameter("birth");

        String salt = BCrypt.gensalt();
        userPW = BCrypt.hashpw(userPW,salt); //salt뿌려서 비밀번호 만들기

        //MemberDto insertMemberDto = new MemberDto();
        /*insertMemberDto.setUserID(userID);
        insertMemberDto.setUserPW(userPW);
        insertMemberDto.setEmail(userEmail);
        insertMemberDto.setAddress(address);
        insertMemberDto.setPostCode(postCode);
        insertMemberDto.setBirth(birth);
        insertMemberDto.setUserName(userName);
        insertMemberDto.setAddressDetail(detailAddress);*/

        //builder 패턴 롬복이 재공하는 기능...
        MemberDto insertMemberDto = MemberDto.builder()
                .userID(userID)
                .userPW(userPW)
                .userName(userName)
                .email(userEmail)
                .postCode(postCode)
                .addressDetail(detailAddress)
                .birth(birth)
                .address(address)
                .grade("member")
                .build();


        MemberDao memberDao = new MemberDao();
        int result = 0;
        result = memberDao.insertMember(insertMemberDto);
        if(result > 0) {
            resp.sendRedirect("../index/index");
        } else {
            ScriptWriter
                    .alertAndBack(resp,"알 수 없는 오류가 발생되었습니다. 잠시후 다시 시도해 주세요");
        }
    }
}
