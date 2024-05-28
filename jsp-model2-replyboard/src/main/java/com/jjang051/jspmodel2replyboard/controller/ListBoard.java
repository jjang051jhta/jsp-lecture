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
        BoardDao totalBoardDao = new BoardDao();
        int total = totalBoardDao.getTotal(); //전체 갯수
        int listPerPage = 10;                 //한번에 보여질 게시물 수
        int paginationPerPage = 5;            //한번에 보여질 페이지네이션 수
        int totalPagination = (int)Math.ceil((double)total / listPerPage);  //total / listPerPage  13

        System.out.println("total===="+total);
        System.out.println("listPerPage===="+listPerPage);
        System.out.println("paginationPerPage===="+paginationPerPage);
        System.out.println("totalPagination===="+totalPagination);

        //1,2,3,4,5   ===   1 ~  5
        //6,7,8,9,10  ===   6 ~ 10
        //11,12,13    ===  11 ~ 13

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
        //1~10, 11~20
        List<BoardDto> boardList =
                boardDao.getPageList(listPerPage*(start-1)+1,listPerPage*start);
        req.setAttribute("boardList",boardList);
        req.setAttribute("totalPagination",totalPagination);
        req.setAttribute("paginationStart",paginationStart);
        req.setAttribute("paginationEnd",paginationEnd);
        req.setAttribute("paginationPerPage",paginationPerPage);



        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
