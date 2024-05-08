package com.jjang051.jsp02;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

//@WebServlet(name="loginProcess", value="/login-process")
@WebServlet("/login-process")
public class LoginProcessServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userPW = request.getParameter("userPW");
        System.out.println(userID+"==="+userPW);
        response.setContentType("text/html;charset=utf-8");
        if(userID.equals("jjang051") && userPW.equals("1234")) {
            //로그인 성공
            response.sendRedirect("/jsp02_war_exploded/login/login-ok.jsp");

        } else {
            PrintWriter out = response.getWriter();
            //out.println("<script>alert(\"아이디 패스워드 확인해주세요\");history.back();</script>");
            out.println("""
                    <script>
                        alert("아이디 패스워드 확인해주세요.");
                        history.back();
                    </script>
                    """);
        }
    }
}
