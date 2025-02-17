package com.jjang051.jspmodel2replyboard.controller;

import com.jjang051.jspmodel2replyboard.dao.BoardDao;
import com.jjang051.jspmodel2replyboard.dto.BoardDto;
import com.jjang051.jspmodel2replyboard.utils.ScriptWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/view")
public class ViewBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int no = Integer.parseInt(req.getParameter("no"));
        int num = Integer.parseInt(req.getParameter("num"));
        System.out.println("num==="+num);
        System.out.println("num+1==="+(num+1));
        System.out.println("num-1==="+(num-1));


        BoardDao boardDao = new BoardDao();
        BoardDto boardDto = boardDao.getBoard(no);
        if(boardDto!=null) {
            //찾게되면 후사하겠습니다.
            BoardDao prevBoardDao = new BoardDao();
            BoardDto prevBoardDto = prevBoardDao.getPrevNextSelect(num - 1);
            BoardDao nextBoardDao = new BoardDao();
            BoardDto nextBoardDto = nextBoardDao.getPrevNextSelect(num + 1);

            req.setAttribute("boardDto", boardDto);
            req.setAttribute("prevBoardDto", prevBoardDto);
            req.setAttribute("nextBoardDto", nextBoardDto);


            RequestDispatcher dispatcher =
                    req.getRequestDispatcher("/WEB-INF/board/view.jsp");
            dispatcher.forward(req, resp);
        } else {
            ScriptWriter.alertAndBack(resp,"알 수 없는 오류가 발생하였습니다. 잠시 후 다시 시도해 주세요.");
        }
    }
}
