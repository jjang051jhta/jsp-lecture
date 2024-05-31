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
import jakarta.servlet.http.Part;
import net.coobird.thumbnailator.Thumbnailator;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Position;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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

        Part profile = req.getPart("profile");
        String renameProfile = "";
        //String originalProfile = "";

        String fileName = profile.getSubmittedFileName();

        String serverUploadDir = this.getServletContext().getRealPath("upload");
        File dir = new File(serverUploadDir);
        if(!dir.exists()) {
            dir.mkdir();
        }
        if(!fileName.isEmpty()) {
            profile.write(serverUploadDir+File.separator+fileName); //원본파일을 미리 써놓기
            String first = fileName.substring(0,fileName.lastIndexOf("."));    //jun
            String extention =  fileName.substring(fileName.lastIndexOf(".")); //jpg
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("YYYYMMdd_hhmmss");
            String formatNow = now.format(dateTimeFormatter);
            renameProfile = first+"_"+formatNow+extention;
            File oldFile =
                    new File(serverUploadDir+File.separator+fileName);
            File newFile =
                    new File(serverUploadDir+File.separator+renameProfile);
            Thumbnails.of(oldFile)
                    //.sourceRegion(Positions.CENTER,100,200)
                    .size(100,200)
                    .toFiles(dir, Rename.NO_CHANGE);
            oldFile.renameTo(newFile);
        }

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
                        .originalProfile(fileName)
                        .renameProfile(renameProfile)
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
