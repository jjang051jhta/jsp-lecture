package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import com.jjang051.mybatis.dto.BoardDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete")
public class DeleteBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/delete.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDto boardDto =
        BoardDto.builder()
               .no(Integer.parseInt(req.getParameter("no")))
                .password(req.getParameter("password"))
               .build();
        System.out.println(boardDto.toString());
        BoardDao boardDao = new BoardDao();
        int result = boardDao.deleteBoard(boardDto);
        System.out.println("result==="+result);
        if(result>0) {
            resp.sendRedirect("../board/list");
        }
    }
}
