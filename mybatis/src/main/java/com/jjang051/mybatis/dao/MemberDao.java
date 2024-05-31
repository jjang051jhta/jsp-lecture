package com.jjang051.mybatis.dao;

import com.jjang051.mybatis.dto.MemberDto;
import com.jjang051.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

public class MemberDao {
    // html (front)  --->  controller(프론트에서 넘어온 데이터 처리) ---> dao 메서드호출
    // ---> dao에서 db에 crud( mybatis / jpa )하고 결과값 들고오기
    public int insertMember(MemberDto memberDto) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("insertMember",memberDto);
        sqlSession.close();
        return result;
    }

    public int idCheck(String userID) {
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.selectOne("idCheck",userID); // 1,0
        sqlSession.close();
        return result;
    }
}
