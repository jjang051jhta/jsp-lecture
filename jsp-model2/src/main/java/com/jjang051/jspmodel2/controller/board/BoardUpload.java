package com.jjang051.jspmodel2.controller.board;

import com.google.gson.Gson;
import com.jjang051.jspmodel2.dao.MemberDao;
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
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/board/upload")
@MultipartConfig
public class BoardUpload extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Part ckUploadedFile = req.getPart("upload");
        //게시판에 이미지 올렸을때  <input type="file" name="upload">

        String renameProfile = "";
        String originalProfile = "";
        String renameFile="";

        //프론트에서 넘어온 파일 이름...
        String fileName = ckUploadedFile.getSubmittedFileName();
        String serverUploadDir =
                this.getServletContext().getRealPath("upload");
        File dir = new File(serverUploadDir);
        //serverUploadDir안에 있는 것들은 서버에서 사용가능핟.
        if(!dir.exists()) {
            dir.mkdir();
        }
        if(!fileName.isEmpty()) {
            //파일이 넘어왔음... 특정경로에 옮겨 놓기...
            ckUploadedFile.write(serverUploadDir+File.separator+fileName);
            String first =
                    fileName.substring(0,fileName.lastIndexOf("."));
            String extention = fileName.substring(fileName.lastIndexOf("."));
            LocalDateTime now =  LocalDateTime.now();  //현재날짜시간
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("YYYYMMdd_HHmmss");
            String formatNow = now.format(dateTimeFormatter);
            renameFile = first+"_"+formatNow+extention;
            File oldFile =
                    new File(serverUploadDir+File.separator+fileName);
            File newFile = new File(serverUploadDir+File.separator+renameFile);
            oldFile.renameTo(newFile);
        }
        Gson gson = new Gson();
        /*{
            "uploaded":"true",
            "url":"이미지 저장경로"
        }*/
        Map<String,Object> map = new HashMap<>();
        map.put("uploaded",true);
        map.put("url",req.getContextPath()+"/upload/"+renameFile);
        String resultJSON = gson.toJson(map);
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json; charset=utf-8");
        out.println(resultJSON);
    }
}
