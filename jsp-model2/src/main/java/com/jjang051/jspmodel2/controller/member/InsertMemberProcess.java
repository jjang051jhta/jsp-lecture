package com.jjang051.jspmodel2.controller.member;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.dto.Grade;
import com.jjang051.jspmodel2.dto.MemberDto;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/member/insert-process")
@MultipartConfig
public class InsertMemberProcess extends HttpServlet {
    //
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

        Part profile = req.getPart("profile");

        String uploadDir = "C:\\Users\\JHTA\\Desktop\\upload";

        System.out.println(profile);
        String partHeader = profile.getHeader("content-disposition");
        System.out.println(partHeader);
        String partArray[] = partHeader.split("filename=");
        System.out.println(partHeader.split("filename="));
        System.out.println("partArray[0]==="+partArray[0]);
        System.out.println("partArray[1]==="+partArray[1]);
        String orignalFileName =
                partArray[1].trim().replace("\"","");
        if(!orignalFileName.isEmpty()) {
            profile.write(uploadDir+ File.separator+orignalFileName);
            String fileName =
            orignalFileName.substring(0,orignalFileName.lastIndexOf("."));
            String extention =
            orignalFileName.substring(orignalFileName.lastIndexOf("."));

            LocalDateTime now =  LocalDateTime.now();
            System.out.println(now);
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("_YYYYMMdd_hhmmss");
            String formatNow = now.format(dateTimeFormatter);
            System.out.println(formatNow);
            String renameFile = fileName+formatNow+extention;
            System.out.println(renameFile);
            File oldFile = new File(uploadDir+File.separator+orignalFileName);
            File newFile = new File(uploadDir+File.separator+renameFile);
            oldFile.renameTo(newFile);
        }

        //partHeader에서 filename을 통해서 올라온 파일명 추출
        //img (4)_fjdskfjdkl.jpg  //  originalfilename, renameFilename
        // img (4)_fjdskfjdkl.jpg


        String salt = BCrypt.gensalt();
        userPW = BCrypt.hashpw(userPW,salt); //salt뿌려서 비밀번호 만들기


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
