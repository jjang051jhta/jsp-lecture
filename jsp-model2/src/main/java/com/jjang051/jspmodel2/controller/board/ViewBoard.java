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

@WebServlet("/board/view")
public class ViewBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int no = Integer.parseInt(req.getParameter("no"));
        BoardDao boardDao = new BoardDao();
        BoardDto boardDto = boardDao.viewBoard(no);
        if(boardDto!=null) {
            req.setAttribute("boardDto",boardDto);
            RequestDispatcher dispatcher =
                  req.getRequestDispatcher("/WEB-INF/board/view.jsp");
            dispatcher.forward(req,resp);
        } else {
            ScriptWriter.alertAndBack(resp,"서버오류");
        }
    }
}
