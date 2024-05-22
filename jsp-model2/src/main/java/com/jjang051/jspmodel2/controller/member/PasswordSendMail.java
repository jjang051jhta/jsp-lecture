package com.jjang051.jspmodel2.controller.member;


import com.jjang051.jspmodel2.dao.MemberDao;
import com.jjang051.jspmodel2.mail.NaverMail;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@WebServlet("/member/password-send")
public class PasswordSendMail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletContext application = req.getServletContext();
        String email = req.getParameter("userEmail");
        String uuid = UUID.randomUUID().toString();
        System.out.println("uuid==="+uuid);
        String changedPW = uuid.substring(0,8);
        MemberDao memberDao = new MemberDao();
        int result = memberDao.updateChangedPassword(email,changedPW);
        if(result>0) {
            Map<String,String> sendMailInfo = new HashMap<>();
            sendMailInfo.put("from","jjang051hta@naver.com");
            sendMailInfo.put("to",email);
            sendMailInfo.put("subject","비밀번호 재설정");
            sendMailInfo.put("content",changedPW);
            sendMailInfo.put("format","text/html; charset=utf-8");
            try {
                NaverMail naverMail = new NaverMail(application);
                naverMail.sendMail(sendMailInfo);
                System.out.println("success");
                ScriptWriter.alertAndNext(resp,"메일이 발송되었습니다.","../member/login");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("fail");
                ScriptWriter.alertAndBack(resp,"메일 전송이 실패하였습니다.");
            }
        }
    }
}
