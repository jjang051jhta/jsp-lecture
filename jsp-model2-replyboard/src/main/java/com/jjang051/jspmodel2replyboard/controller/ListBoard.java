package com.jjang051.jspmodel2replyboard.controller;

import com.jjang051.jspmodel2replyboard.dao.BoardDao;
import com.jjang051.jspmodel2replyboard.dto.BoardDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/board/list")
public class ListBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        String searchWord = req.getParameter("searchWord");

        int total=0;
        BoardDao totalBoardDao = new BoardDao();
        if(search==null) {
            total = totalBoardDao.getTotal(); //검색 아닐때 전체 갯수
        } else {
            total = totalBoardDao.getTotal(search,searchWord); // 검색있을때 전체 갯수
        }

        int listPerPage = 10;                 //한번에 보여질 게시물 수
        int paginationPerPage = 5;            //한번에 보여질 페이지네이션 수
        int totalPagination = (int)Math.ceil((double)total / listPerPage);  //total / listPerPage  13



        int start = 1;
        int paginationStart = 1;

        int paginationEnd = paginationStart+paginationPerPage - 1;
        if(req.getParameter("page")!=null) {
            start =  Integer.parseInt(req.getParameter("page"));
        }
        paginationStart = ((start - 1) / paginationPerPage)*paginationPerPage + 1;  //1~5
        paginationEnd =   paginationStart+paginationPerPage - 1;
        if(paginationEnd > totalPagination) {
            paginationEnd = totalPagination;
        }



        BoardDao boardDao = new BoardDao();
        List<BoardDto> boardList = null;
        if(search==null) {
            //1~10, 11~20
            boardList =
                    boardDao.getPageList(listPerPage * (start - 1) + 1, listPerPage * start);
        } else {
            boardList =
                    boardDao.searchBoard(search,searchWord,listPerPage * (start - 1) + 1, listPerPage * start);
        }
        req.setAttribute("boardList",boardList);
        req.setAttribute("totalPagination",totalPagination);
        req.setAttribute("paginationStart",paginationStart);
        req.setAttribute("paginationEnd",paginationEnd);
        req.setAttribute("paginationPerPage",paginationPerPage);
        req.setAttribute("search",search);
        req.setAttribute("searchWord",searchWord);



        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
