package com.jjang051.jspmodel2replyboard.dao;

import com.jjang051.jspmodel2replyboard.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2replyboard.dto.BoardDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBCConnectionPool {

    //원래 글쓰기
    public int writeBoard(BoardDto boardDto) {

        int result = 0;
        String sql =
           "insert into board values(board_seq.nextval,?,?,?,?,?,?,?,?,1,sysdate,1)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,boardDto.getSubject());
            pstmt.setString(2,boardDto.getContent());
            pstmt.setString(3,boardDto.getUserID());
            pstmt.setString(4,boardDto.getUserName());
            pstmt.setString(5,boardDto.getPassword());
            pstmt.setInt(6,boardDto.getRegroup());
            pstmt.setInt(7,1);
            pstmt.setInt(8,1);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }
    public int getMaxRegroup() {
        int result = 0;
        String sql = "select nvl(max(regroup),0) as max from board";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result = rs.getInt("max");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }


    public List<BoardDto> getList() {
        List<BoardDto> boardList = null;
        String sql = "select * from board where  order by regroup desc, relevel asc";
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
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .password(rs.getString("password"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .hit(rs.getInt("hit"))
                        .regDate(rs.getString("regdate"))
                        .available(rs.getInt("available"))
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

    public List<BoardDto> getPageList(int start, int end) {
        List<BoardDto> boardList = null;
        String sql = "SELECT * FROM " +
                "(SELECT rownum AS num, b01.* from " +
                " (SELECT * FROM board ORDER BY NO DESC) b01) " +
                "WHERE num BETWEEN ? AND ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            boardList = new ArrayList<>();
            while(rs.next()) {
                BoardDto boardDto =
                        BoardDto.builder()
                                .no(rs.getInt("no"))
                                .subject(rs.getString("subject"))
                                .content(rs.getString("content"))
                                .userID(rs.getString("userid"))
                                .userName(rs.getString("username"))
                                .password(rs.getString("password"))
                                .regroup(rs.getInt("regroup"))
                                .relevel(rs.getInt("relevel"))
                                .restep(rs.getInt("restep"))
                                .hit(rs.getInt("hit"))
                                .regDate(rs.getString("regdate"))
                                .available(rs.getInt("available"))
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

    public BoardDto getBoard(int no) {
        BoardDto boardDto = null;
        String sql = "select * from board where no = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,no);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                boardDto =
                BoardDto.builder()
                        .no(rs.getInt("no"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .password(rs.getString("password"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .hit(rs.getInt("hit"))
                        .regDate(rs.getString("regdate"))
                        .available(rs.getInt("available"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }

        return boardDto;
    }

    public int updateRelevel(BoardDto boardDto) {
        int result = 0;
        String sql =
     "UPDATE board SET relevel = relevel + 1 WHERE regroup = ? AND relevel > ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,boardDto.getRegroup());
            pstmt.setInt(2,boardDto.getRelevel());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }

    public int replyBoard(BoardDto boardDto) {
        int result = 0;
        String sql =
                "insert into board values(board_seq.nextval,?,?,?,?,?,?,?,?,1,sysdate,1)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,boardDto.getSubject());
            pstmt.setString(2,boardDto.getContent());
            pstmt.setString(3,boardDto.getUserID());
            pstmt.setString(4,boardDto.getUserName());
            pstmt.setString(5,boardDto.getPassword());
            pstmt.setInt(6,boardDto.getRegroup());
            pstmt.setInt(7,boardDto.getRelevel());
            pstmt.setInt(8,boardDto.getRestep());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }

    public int deleteBoard(BoardDto boardDto) {
        int result = 0;
        String sql = "update board set available = 0 where no = ? and password = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,boardDto.getNo());
            pstmt.setString(2,boardDto.getPassword());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }
    public int getTotal() {
        //125
        int result = 0;
        String sql = "select count(*) as total from board";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result = rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }

    public List<BoardDto> searchBoard(String search, String searchWord,int start, int end) {
        List<BoardDto> searchBoardList =  null;
        String sql = "";
        //1 삭제된 글은 검색되면 안됨...
        //2 페이징 처리
        //3 all 처리
        String searchSql = "";
        try {
            if(search.equals("subject")) {
                searchSql =  "subject like '%'||?||'%'";

            } else if(search.equals("content")) {
                searchSql=  "content like '%'||?||'%'";
            } else if(search.equals("username")) {
                searchSql =  "username like '%'||?||'%'";
            } else {
                searchSql =  "subject like '%'||?||'%' or content like '%'||?||'%'";
            }
            sql = "SELECT * FROM "+
                    "(SELECT rownum AS num, b01.* from "+
                            "(SELECT * FROM board "+
                                    "WHERE available = 1 and "+
                                    searchSql+
            "ORDER BY regroup DESC, relevel asc) b01) "+
            "WHERE num BETWEEN ? AND ?";
            pstmt = conn.prepareStatement(sql);
            if(!search.equals("all")) {
                pstmt.setString(1, searchWord);
                pstmt.setInt(2, start);
                pstmt.setInt(3, end);
            } else {
                pstmt.setString(1, searchWord);
                pstmt.setString(2, searchWord);
                pstmt.setInt(3, start);
                pstmt.setInt(4, end);
            }
            rs = pstmt.executeQuery();
            searchBoardList = new ArrayList<>();
            while(rs.next()) {
                BoardDto boardDto =
                BoardDto.builder()
                        .no(rs.getInt("no"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .password(rs.getString("password"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .hit(rs.getInt("hit"))
                        .regDate(rs.getString("regdate"))
                        .available(rs.getInt("available"))
                        .build();
                searchBoardList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return searchBoardList;
    }
    public int getTotal(String search, String searchWord) {
        //125
        int result = 0;
        String sql="";
        if(search.equals("subject")) {
            sql = "select count(*) as total from board where subject like '%'||?||'%'";
        } else if(search.equals("content")) {
            sql = "select count(*) as total from board where content like '%'||?||'%'";
        } else if(search.equals("username")) {
            sql = "select count(*) as total from board where username like '%'||?||'%'";
        } else {
            sql = "select count(*) as total from board where subject like '%'||?||'%' or content like '%'||?||'%'";
        }

        try {
            pstmt = conn.prepareStatement(sql);
            if(!search.equals("all")) {
                pstmt.setString(1, searchWord);
            } else {
                pstmt.setString(1, searchWord);
                pstmt.setString(2, searchWord);
            }
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result = rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }
}
