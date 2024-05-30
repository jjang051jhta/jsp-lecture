package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.dto.SearchDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/search")
public class SearchBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search  = req.getParameter("search");
        String searchWord  = req.getParameter("searchWord");
        SearchDto searchDto =
                SearchDto.builder()
                        .search(search)
                        .searchWord(searchWord)
                        .build();
        BoardDao boardDao = new BoardDao();
        List<BoardDto> boardList = boardDao.searchBoard(searchDto);
        System.out.println("boardList size==="+boardList.size());
        req.setAttribute("boardList",boardList);
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/search-list.jsp");
        dispatcher.forward(req,resp);

    }
}
