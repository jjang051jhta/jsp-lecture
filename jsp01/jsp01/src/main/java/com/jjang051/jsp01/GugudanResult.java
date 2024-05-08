package com.jjang051.jsp01;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name="gugudanResult" , value="/gugudan-result")
public class GugudanResult extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
        //response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        int dan = Integer.parseInt(requset.getParameter("gugudan"));
        PrintWriter out = response.getWriter();
        out.println("<h1>"+dan+"단</h1>");
        out.println("<ul>");
            for(int i=1;i<10;i++) {
                out.println("<li>"+dan+ "x"+ i +"="+dan*i+"</li>");
            }
        out.println("</ul>");

    }
}
