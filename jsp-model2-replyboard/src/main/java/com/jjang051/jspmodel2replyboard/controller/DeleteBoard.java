package com.jjang051.jspmodel2replyboard.controller;

import com.jjang051.jspmodel2replyboard.dao.BoardDao;
import com.jjang051.jspmodel2replyboard.dto.BoardDto;
import com.jjang051.jspmodel2replyboard.utils.ScriptWriter;
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
        RequestDispatcher dispatcher=
        req.getRequestDispatcher("/WEB-INF/board/delete.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDto boardDto = BoardDto
                .builder()
                .no(Integer.parseInt(req.getParameter("no")))
                .password(req.getParameter("password"))
                .build();
        BoardDao boardDao = new BoardDao();
        int result = boardDao.deleteBoard(boardDto);
        if(result>0) {
            resp.sendRedirect("../board/list");
        } else {
            ScriptWriter.alertAndBack(resp,"서버 오류입니다. 잠시 후 다시 시도해 주세요.");
        }
    }
}
