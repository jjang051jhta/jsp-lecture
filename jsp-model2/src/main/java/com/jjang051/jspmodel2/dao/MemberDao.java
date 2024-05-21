package com.jjang051.jspmodel2.dao;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.dto.MemberDto;

import java.sql.SQLException;

public class MemberDao extends JDBCConnectionPool {
    //1. db연결
    //2. sql 생성
    //3. preparedstatement에 값 설정
    //4. select(executeQuery  resultSet) 또는 나머지 것들(executeUpdate  int)

    public int insertMember(MemberDto memberDto) throws SQLException {
        int result = 0;
        try {
            String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,memberDto.getUserID());
            pstmt.setString(2, memberDto.getUserPW());
            pstmt.setString(3, memberDto.getUserName());
            pstmt.setString(4, memberDto.getEmail());
            pstmt.setInt(5, memberDto.getPostCode());
            pstmt.setString(6, memberDto.getAddress());
            pstmt.setString(7, memberDto.getAddressDetail());
            pstmt.setString(8, memberDto.getBirth());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            conn.close();
        }
        return result;
    }

    public int checkDuplicateId(String userID) {
        int result = 0;
        String sql = "select count(*) as count from member where userid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                result = rs.getInt("count");// 0, 1
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
}
