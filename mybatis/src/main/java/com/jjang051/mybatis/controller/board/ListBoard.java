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
        int page = Integer.parseInt(req.getParameter("page"));
        /*Map<String,Integer> pageMap = new HashMap<>();
        pageMap.put("start",11);
        pageMap.put("end",20);*/
        PageDto pageDto = new PageDto();
        pageDto.setStart(1);
        pageDto.setEnd(10);
        BoardDao boardDao = new BoardDao();
        //List<BoardDto> boardList = boardDao.getBoardList(pageMap);
        List<BoardDto> boardList = boardDao.getBoardList(pageDto);
        req.setAttribute("boardList",boardList);
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
