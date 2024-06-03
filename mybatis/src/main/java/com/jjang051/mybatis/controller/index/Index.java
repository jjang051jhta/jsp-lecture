package com.jjang051.mybatis.controller.index;

import com.jjang051.mybatis.dto.ModalDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/index/index")
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //ModalDto modalDto = new ModalDto("타이틀","내용들어갑니다.","show");
        //req.setAttribute("modal",modalDto);
        req.getRequestDispatcher("/WEB-INF/index/index.jsp").forward(req,resp);
    }
}
