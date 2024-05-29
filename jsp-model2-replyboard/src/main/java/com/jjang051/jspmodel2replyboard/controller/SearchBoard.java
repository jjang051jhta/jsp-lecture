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

@WebServlet("/board/search")
public class SearchBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String search = req.getParameter("search");
        String searchWord = req.getParameter("searchWord");
        System.out.println("search=="+search);
        System.out.println("searchWord=="+searchWord);

        BoardDao searchTotalDao = new BoardDao();
        int total = searchTotalDao.getTotal(search,searchWord);
        int listPerPage = 10;                 //한번에 보여질 게시물 수
        int paginationPerPage = 5;            //한번에 보여질 페이지네이션 수
        int totalPagination = (int)Math.ceil((double)total / listPerPage);  //total / listPerPage  13

        System.out.println("total===="+total);
        System.out.println("listPerPage===="+listPerPage);
        System.out.println("paginationPerPage===="+paginationPerPage);
        System.out.println("totalPagination===="+totalPagination);

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

        System.out.println("paginationStart=="+paginationStart);
        System.out.println("paginationEnd=="+paginationEnd);




        BoardDao boardDao = new BoardDao();
        List<BoardDto> searchBoardList =
                boardDao.searchBoard(search,searchWord,listPerPage*(start-1)+1,listPerPage*start);

        req.setAttribute("totalPagination",totalPagination);
        req.setAttribute("paginationStart",paginationStart);
        req.setAttribute("paginationEnd",paginationEnd);
        req.setAttribute("paginationPerPage",paginationPerPage);
        req.setAttribute("search",search);
        req.setAttribute("searchWord",searchWord);


        req.setAttribute("boardList",searchBoardList);
        RequestDispatcher dispatcher =
        req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
