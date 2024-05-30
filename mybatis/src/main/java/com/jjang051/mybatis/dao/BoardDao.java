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

        sqlSession.close();
        return boardDto;
    }
    public List<BoardDto> getBoardList(Map<String,Integer> pageMap) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList", pageMap);
        sqlSession.close();
        return boardList;
    }
    public List<BoardDto> getBoardList(PageDto pageDto) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList", pageDto);
        sqlSession.close();
        return boardList;
    }

    public int getBoardTotal() {
        int total = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        total = sqlSession.selectOne("getBoardTotal");
        sqlSession.close();
        return total;
    }

    public int deleteBoard(BoardDto boardDto) {
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        int result = sqlSession.delete("deleteBoard",boardDto);
        System.out.println("dao result==="+result);
        sqlSession.close();
        return result;
    }
    public List<BoardDto> searchBoard(SearchDto searchDto) {
        List<BoardDto> boardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("searchBoard",searchDto);
        sqlSession.close();
        return boardList;
    }
}
