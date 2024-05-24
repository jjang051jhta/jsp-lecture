package com.jjang051.jspmodel2.controller.board;

import com.jjang051.jspmodel2.dao.BoardDao;
import com.jjang051.jspmodel2.dto.BoardDto;
import com.jjang051.jspmodel2.utils.ScriptWriter;
import jakarta.servlet.RequestDispatcher;
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
        RequestDispatcher dispatcher=
        req.getRequestDispatcher("/WEB-INF/board/write.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String subject = req.getParameter("subject");
        String content = req.getParameter("content");
        String userID = req.getParameter("userID");


        BoardDto writeBoardDto =
                BoardDto.builder()
                        .subject(subject)
                        .password(password)
                        .content(content)
                        .userID(userID)
                        .userName(userName)
                        .build();

        BoardDao boardDao = new BoardDao();
        int result = boardDao.writeBoard(writeBoardDto);
        if(result>0) {
            resp.sendRedirect("../index/index");
        } else {
            ScriptWriter.alertAndBack(resp,"서버오류");
        }
    }
}
