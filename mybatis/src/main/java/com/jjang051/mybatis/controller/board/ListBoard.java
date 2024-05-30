package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.dto.PageDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/board/list")
public class ListBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int start = 1;
        int end = 10;
        int paginationStart = 1;
        int paginationEnd = 10;
        if(req.getParameter("page")!=null) {
            start = (Integer.parseInt(req.getParameter("page")) - 1)*10+1;
        }
        end = start+10;
        /*Map<String,Integer> pageMap = new HashMap<>();
        pageMap.put("start",11);
        pageMap.put("end",20);*/
        PageDto pageDto = new PageDto();
        pageDto.setStart(start);
        pageDto.setEnd(end);
        BoardDao boardDao = new BoardDao();
        BoardDao boardTotalDao = new BoardDao();
        int total = boardTotalDao.getBoardTotal();
        List<BoardDto> boardList = boardDao.getBoardList(pageDto);
        req.setAttribute("boardList",boardList);
        req.setAttribute("total",total);
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
