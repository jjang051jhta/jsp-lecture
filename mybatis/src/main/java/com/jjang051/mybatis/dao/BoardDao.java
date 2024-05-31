package com.jjang051.mybatis.dao;

import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.dto.PageDto;
import com.jjang051.mybatis.dto.SearchDto;
import com.jjang051.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class BoardDao {
    public BoardDto getBoard(int no) {
        BoardDto boardDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardDto = sqlSession.selectOne("getBoard",no);
        sqlSession.commit();
        sqlSession.close();
        return boardDto;
    }
    public List<BoardDto> getBoardList(Map<String,Integer> pageMap) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList", pageMap);
        sqlSession.commit();
        sqlSession.close();
        return boardList;
    }
    public List<BoardDto> getBoardList(PageDto pageDto) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList", pageDto);
        sqlSession.commit();
        sqlSession.close();
        return boardList;
    }

    public int getBoardTotal() {
        int total = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        total = sqlSession.selectOne("getBoardTotal");
        sqlSession.commit();
        sqlSession.close();
        return total;
    }

    public int deleteBoard(BoardDto boardDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        int result = sqlSession.delete("deleteBoard",boardDto);
        System.out.println("dao result==="+result);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
    public List<BoardDto> searchBoard(SearchDto searchDto) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("searchBoard",searchDto);
        sqlSession.commit();
        sqlSession.close();
        return boardList;
    }

    public int getMaxRegroup() {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.selectOne("getMaxRegroup");
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public int writeBoard(BoardDto boardDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("writeBoard",boardDto);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
    public int updateRelevel(BoardDto boardDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.update("updateRelevel",boardDto);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
    public int replyBoard(BoardDto boardDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("replyBoard",boardDto);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }

    public int deleteAllBoard(int[] noArray) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(false);
        result = sqlSession.delete("deleteAllBoard",noArray);
        if(noArray.length==result) {
            sqlSession.commit();
        }else {
            sqlSession.rollback();
        }
        System.out.println("result==="+result);


        sqlSession.close();
        return result;
    }

    public int getSearchBoardTotal(SearchDto searchDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.selectOne("getSearchBoardTotal",searchDto);
        sqlSession.close();
        return result;
    }
}
