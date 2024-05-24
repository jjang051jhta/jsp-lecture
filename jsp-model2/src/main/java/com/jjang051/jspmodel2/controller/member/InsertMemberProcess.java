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
import lombok.extern.slf4j.Slf4j;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/member/insert-process")
@MultipartConfig
public class InsertMemberProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userID = req.getParameter("userID");
        String userPW = req.getParameter("userPW");
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        Integer postCode = Integer.parseInt(req.getParameter("postCode"));
        String address = req.getParameter("address");
        String detailAddress = req.getParameter("detailAddress");
        String birth = req.getParameter("birth");

        Part profile = req.getPart("profile");

        String renameProfile = "";
        String originalProfile = "";
        String renameFile="";

        //String submittedFileName =   profile.getSubmittedFileName();

        //프론트에서 넘어온 파일 이름...
        String fileName = profile.getSubmittedFileName();
        String serverUploadDir =
                this.getServletContext().getRealPath("upload");
        File dir = new File(serverUploadDir);
        //serverUploadDir안에 있는 것들은 서버에서 사용가능핟.
        if(!dir.exists()) {
            dir.mkdir();
        }
        if(!fileName.isEmpty()) {
            //파일이 넘어왔음... 특정경로에 옮겨 놓기...
            profile.write(serverUploadDir+File.separator+fileName);
            String first =
                    fileName.substring(0,fileName.lastIndexOf("."));
            String extention = fileName.substring(fileName.lastIndexOf("."));
            LocalDateTime now =  LocalDateTime.now();  //현재날짜시간
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("YYYYMMdd_hhmmss");
            String formatNow = now.format(dateTimeFormatter);
            renameFile = first+"_"+formatNow+extention;
            System.out.println(renameFile);
            File oldFile =
                    new File(serverUploadDir+File.separator+fileName);
            File newFile = new File(serverUploadDir+File.separator+renameFile);
            oldFile.renameTo(newFile);
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
                .originalProfile(fileName)
                .renameProfile(renameFile)
                .build();

        //  originalProfile== jun.jpg
        //  renameProfile==jun_20240524_101007.jpg

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
