package com.jjang051.mybatis.controller.board;

import com.jjang051.mybatis.dao.BoardDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/delete-all")
public class DeleteAllBoard extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tempArray[] = req.getParameterValues("check");
        int noArray[] =  new int[tempArray.length];
        for(int i=0;i<tempArray.length;i++) {
            noArray[i] = Integer.parseInt(tempArray[i]);
        }
        BoardDao boardDao = new BoardDao();
        int result = boardDao.deleteAllBoard(noArray);
        System.out.println("delete result==="+result);
        resp.sendRedirect("../board/list?page=1");
        //1,2,3,4,5
    }
}
