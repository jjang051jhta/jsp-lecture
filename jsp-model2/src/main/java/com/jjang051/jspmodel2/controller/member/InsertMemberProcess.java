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
        String renameProfile = "";   // jun_20250523-151234.jpg
        String originalProfile = ""; // jun.jpg
        Part profile = req.getPart("profile");
        String renameFile="";

        String partHeader = profile.getHeader("content-disposition");
        String partArray[] = partHeader.split("filename=");
        String originalFileName =
                partArray[1].trim().replace("\"","");
        //  jun.jpg

        //localhost:8080/upload/
		String serverUploadDir = this.getServletContext().getRealPath("upload");
        System.out.println("serverUploadDir==="+serverUploadDir);
		File dir = new File(serverUploadDir);
		if(!dir.exists()) {
			dir.mkdir();
		}
        if(!originalFileName.isEmpty()) {
            profile.write(serverUploadDir+File.separator+originalFileName);
            //localhost:8080/upload/jun.jpg
            String fileName =
            originalFileName.substring(0,originalFileName.lastIndexOf("."));
            String extention =
            originalFileName.substring(originalFileName.lastIndexOf("."));

            LocalDateTime now =  LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("_YYYYMMdd_hhmmss");
            String formatNow = now.format(dateTimeFormatter);
            renameFile = fileName+formatNow+extention;
            //jun_20240513-151234.jpg

            originalProfile = serverUploadDir+File.separator+originalFileName;
            //localhost:8080/upload/jun.jpg
            renameProfile = serverUploadDir+File.separator+renameFile;
            //localhost:8080/upload/jun_20240513-151234.jpg

            File oldFile = new File(originalProfile);
            File newFile = new File(renameProfile);
            oldFile.renameTo(newFile); //덮어쓰기
        }

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
                .originalProfile(originalProfile)
                .renameProfile(renameFile)
                .build();
            //localhost:8080/upload/jun.jpg
           //localhost:8080/upload/jun_202405231513334.jpg



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
