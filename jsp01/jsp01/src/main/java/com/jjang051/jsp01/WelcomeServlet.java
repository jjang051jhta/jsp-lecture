package com.jjang051.jsp01;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "welcomeServlet", value = "/welcome-servlet")
public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //content type    서버에서 내려보내줄때 파일 형식을 지정해서 보내줄 수 있음
        //response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h1>welcome servlet</h1></body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
