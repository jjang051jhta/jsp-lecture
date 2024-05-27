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

@WebServlet("/board/reply")
public class ReplyBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/reply.jsp");
        dispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDto boardDto =
                BoardDto.builder()
                        .regroup(Integer.parseInt(req.getParameter("regroup")))
                        .relevel(Integer.parseInt(req.getParameter("relevel")))
                        .build();
        BoardDao updateRelevelDao = new BoardDao();
        int result = updateRelevelDao.updateRelevel(boardDto); // 나 이외의 것들을 업데이트
        BoardDto boardDto02 =
                BoardDto.builder()
                        .subject(req.getParameter("subject"))
                        .content(req.getParameter("content"))
                        .password(req.getParameter("password"))
                        .userID(req.getParameter("userID"))
                        .userName(req.getParameter("userName"))
                        .regroup(Integer.parseInt(req.getParameter("regroup")))
                        .relevel(Integer.parseInt(req.getParameter("relevel"))+1)
                        .restep(Integer.parseInt(req.getParameter("restep"))+1)
                        .build();
        BoardDao replyBoardDao = new BoardDao();
        int result02 = replyBoardDao.replyBoard(boardDto02);

        if(result02>0) {
            //원글이 입력됨...
            resp.sendRedirect("../board/list");
        } else {
            ScriptWriter
                    .alertAndBack(resp,"알 수 없는 오류가 발생되었습니다. 잠시 후 다시 시도해 주세요.");
        }
    }
}
