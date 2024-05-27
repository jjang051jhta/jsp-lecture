package com.jjang051.jspmodel2.dao;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.dto.BoardDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBCConnectionPool {

    public int writeBoard(BoardDto writeBoardDto) {
        int result = 0;

        String sql =
                "insert into board values(board_seq.nextval,?,?,?,?,?,?,?,?,1,sysdate)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,writeBoardDto.getSubject());
            pstmt.setString(2,writeBoardDto.getContent());
            pstmt.setString(3,writeBoardDto.getUserID());
            pstmt.setString(4,writeBoardDto.getUserName());
            pstmt.setString(5,writeBoardDto.getPassword());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }


        return result;
    }

    public BoardDto viewBoard(int no) {
        BoardDto boardDto = null;
        String sql =
                "select * from board where no = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,no);

            rs = pstmt.executeQuery();
            if(rs.next()){
                boardDto =
                        BoardDto.builder()
                                .no(rs.getInt("no"))
                                .subject(rs.getString("subject"))
                                .content(rs.getString("content"))
                                .hit(rs.getInt("hit"))
                                .regDate(rs.getString("regdate"))
                                .userID(rs.getString("userid"))
                                .userName(rs.getString("username"))
                                .password(rs.getString("password"))
                                .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return boardDto;
    }

    public List<BoardDto> getBoardList() {
        List<BoardDto> boardList = null;
        String sql = "select * from board";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            boardList = new ArrayList<>();
            while(rs.next()) {
                BoardDto boardDto =
                        BoardDto.builder()
                                .no(rs.getInt("no"))
                                .subject(rs.getString("subject"))
                                .content(rs.getString("content"))
                                .hit(rs.getInt("hit"))
                                .regDate(rs.getString("regdate"))
                                .userID(rs.getString("userid"))
                                .userName(rs.getString("username"))
                                .password(rs.getString("password"))
                                .build();
                boardList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return boardList;
    }
}
