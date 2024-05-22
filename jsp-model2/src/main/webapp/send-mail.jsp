<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.jjang051.jspmodel2.mail.NaverMail" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-22
  Time: 오전 11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<String,String> sendMailInfo = new HashMap<>();
    sendMailInfo.put("from","jjang051hta@naver.com");
    sendMailInfo.put("to","jjang051@hanmail.net");
    sendMailInfo.put("subject","비밀번호 재설정");
    sendMailInfo.put("content","1234");
    sendMailInfo.put("format","text/plain; charset=utf-8");
    try {
        NaverMail naverMail = new NaverMail();
        naverMail.sendMail(sendMailInfo);
        System.out.println("success");
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println("fail");
    }
%>