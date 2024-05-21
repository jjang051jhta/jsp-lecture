package com.jjang051.jspmodel2.dao;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.controller.member.InfoMember;
import com.jjang051.jspmodel2.dto.MemberDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao extends JDBCConnectionPool {
    //1. db연결
    //2. sql 생성
    //3. preparedstatement에 값 설정
    //4. select(executeQuery  resultSet) 또는 나머지 것들(executeUpdate  int)

    public int insertMember(MemberDto memberDto)  {
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
            this.close();
        }
        return result;
    }

    public int checkDuplicateId(String userID)  {
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
        } finally {
            this.close();
        }
        return result;
    }

    public MemberDto loginMember(String userID, String userPW) {
        String sql = "select * from member where userid = ? and userpw = ?";
        MemberDto loginMemberDto = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            pstmt.setString(2,userPW);
            rs = pstmt.executeQuery();
            if(rs.next()){
                loginMemberDto = new MemberDto();
                loginMemberDto.setUserName(rs.getString("username"));
                loginMemberDto.setUserID(rs.getString("userid"));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return loginMemberDto;
    }

    public MemberDto infoMember(String userID) {
        MemberDto infoMemberDto = null;
        String sql = "select * from member where userid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                infoMemberDto =
                MemberDto.builder()
                        .userName(rs.getString("username"))
                        .email(rs.getString("email"))
                        .address(rs.getString("address"))
                        .addressDetail(rs.getString("address_detail"))
                        .postCode(rs.getInt("postcode"))
                        .birth(rs.getString("birth"))
               .build();
                //infoMemberDto.setUserName(rs.getString("username"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return infoMemberDto;
    }

    public List<MemberDto> listMember() {
        List<MemberDto> memberList = null;
        String sql = "select * from member";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            memberList = new ArrayList<>();
            while (rs.next()) {
                MemberDto memberDto =
                MemberDto.builder()
                        .no(rs.getInt("no"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .email(rs.getString("email"))
                        .postCode(rs.getInt("postcode"))
                        .address(rs.getString("address"))
                        .addressDetail(rs.getString("address_detail"))
                        .birth(rs.getString("birth"))
                .build();
                memberList.add(memberDto);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return memberList;
    }

    public int deleteMember(String userID) {
        int result = 0;
        String sql = "delete from member where userid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }
}
