package com.jjang051.jspmodel2.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/*@WebServlet(name="testForm", value="/TestForm.do")*/
@WebServlet("/TestForm.do")
public class TestForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //super.doGet(req, resp);
        System.out.println("testform call get");
        request.setAttribute("name","장성호");
        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/test.jsp");
        dispatcher.forward(request,response);
        //dispatcher 주소는 그대로 쓰면서 page만 노출할때

    }
}
