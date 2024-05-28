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
        int totalPage = (int)Math.ceil((double)total / listPerPage);  //total / listPerPage  13
        //totalPage / paginationPerPage
        int totalPagination =
                (int)Math.ceil((double)totalPage / paginationPerPage);
        System.out.println("total===="+total);
        System.out.println("listPerPage===="+listPerPage);
        System.out.println("paginationPerPage===="+paginationPerPage);
        System.out.println("totalPage===="+totalPage);
        System.out.println("totalPagination===="+totalPagination);

        int start = Integer.parseInt(req.getParameter("page"));



        BoardDao boardDao = new BoardDao();
        //1~10, 11~20
        List<BoardDto> boardList =
                boardDao.getPageList(listPerPage*(start-1)+1,listPerPage*start);
        req.setAttribute("boardList",boardList);
        req.setAttribute("totalPage",totalPage);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/board/list.jsp");
        dispatcher.forward(req,resp);
    }
}
