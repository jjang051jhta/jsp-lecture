package com.jjang051.mybatis.dao;

import com.jjang051.mybatis.dto.BoardDto;
import com.jjang051.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

public class BoardDao {
    public BoardDto getBoard() {
        BoardDto boardDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardDto = sqlSession.selectOne("getBoard",281);

        sqlSession.close();
        return boardDto;
    }
}
