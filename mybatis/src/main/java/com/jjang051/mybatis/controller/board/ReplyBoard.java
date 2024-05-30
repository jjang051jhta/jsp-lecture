package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.utils.ScriptWriter;
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
        req.getRequestDispatcher("/WEB-INF/board/reply.jsp")
                .forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        BoardDto updateBoardDto =
                BoardDto
                        .builder()
                        .regroup(Integer.parseInt(req.getParameter("regroup")))
                        .relevel(Integer.parseInt(req.getParameter("relevel")))
                        .build();
        BoardDao updateRelevelDao =  new BoardDao();
        updateRelevelDao.updateRelevel(updateBoardDto);
        BoardDto boardDto =
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
        BoardDao boardDao = new BoardDao();
        int result = boardDao.replyBoard(boardDto);
        if(result>0) {
            resp.sendRedirect("../board/list");
        } else {
            ScriptWriter.alertAndBack(resp,"알 수 없는 여유가 발생하였습니다. 잠시 후 다시 시도해 주세요.");
        }
    }
}
