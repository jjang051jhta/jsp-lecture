package com.jjang051.jspmodel2replyboard.controller;

import com.jjang051.jspmodel2replyboard.dao.BoardDao;
import com.jjang051.jspmodel2replyboard.dto.BoardDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/list")
public class ListBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao boardDao = new BoardDao();
        List<BoardDto> boardList = boardDao.getList();
        req.setAttribute("boardList",boardList);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
