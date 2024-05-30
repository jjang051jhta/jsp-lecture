package com.jjang051.mybatis.dao;

import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.dto.PageDto;
import com.jjang051.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class BoardDao {
    public BoardDto getBoard() {
        BoardDto boardDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardDto = sqlSession.selectOne("getBoard",281);

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
}
