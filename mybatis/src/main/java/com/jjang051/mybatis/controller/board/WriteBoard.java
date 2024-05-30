package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import com.jjang051.mybatis.dto.BoardDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/write")
public class WriteBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/board/write.jsp")
                .forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDao maxRegroupDao = new BoardDao();
        int regroup = maxRegroupDao.getMaxRegroup();
        BoardDao writeBoardDao = new BoardDao();
        BoardDto boardDto =
                BoardDto.builder()
                        .subject(req.getParameter("subject"))
                        .content(req.getParameter("content"))
                        .password(req.getParameter("password"))
                        .userID(req.getParameter("userID"))
                        .userName(req.getParameter("userName"))
                        .regroup(regroup+1)
                        .build();
        int result = writeBoardDao.writeBoard(boardDto);
        if(result>0) {
            resp.sendRedirect("../board/list?page=1");
        }
    }
}
