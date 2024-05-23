package com.jjang051.jspmodel2.dao;

import com.jjang051.jspmodel2.connect.JDBCConnectionPool;
import com.jjang051.jspmodel2.controller.member.InfoMember;
import com.jjang051.jspmodel2.dto.Grade;
import com.jjang051.jspmodel2.dto.MemberDto;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDao extends JDBCConnectionPool {
    //1. db연결
    //2. sql 생성
    //3. preparedstatement에 값 설정
    //4. select(executeQuery  resultSet) 또는 나머지 것들(executeUpdate  int)

    public int insertMember(MemberDto memberDto)  {
        //UserRole role = UserRole.valueOf(roleStr);  // 문자열을 enum으로 변환
        int result = 0;
        try {
            String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,memberDto.getUserID());
            pstmt.setString(2, memberDto.getUserPW());
            pstmt.setString(3, memberDto.getUserName());
            pstmt.setString(4, memberDto.getEmail());
            pstmt.setInt(5, memberDto.getPostCode());
            pstmt.setString(6, memberDto.getAddress());
            pstmt.setString(7, memberDto.getAddressDetail());
            pstmt.setString(8, "member");
            pstmt.setString(9, memberDto.getBirth());
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

    public MemberDto loginMember(String userID,String userPW) {
        String sql = "select * from member where userid = ?";
        MemberDto loginMemberDto = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            //pstmt.setString(2,userPW);
            rs = pstmt.executeQuery();
            if(rs.next()){
                String decodePW = rs.getString("userpw"); //493894283
                System.out.println("decodePW==="+decodePW);
                //checkpw를 통해서 평문 비밀번호랑 암호화된 비밀번호 맞는지 체크
                if(BCrypt.checkpw(userPW,decodePW)) {
                    loginMemberDto = new MemberDto();
                    loginMemberDto.setUserName(rs.getString("username"));
                    loginMemberDto.setUserID(rs.getString("userid"));
                    System.out.println("login success");
                } else {
                    System.out.println("login fail");
                }
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


    public int updateChangedPassword(String email, String changedPW) {
        int result = 0;
        String sql = "UPDATE MEMBER SET userpw = ? WHERE email = ?";
        String salt = BCrypt.gensalt();
        String encodedPW = BCrypt.hashpw(changedPW,salt); //salt뿌려서 비밀번호 만들기
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,encodedPW);
            pstmt.setString(2,email);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }

    public int changedPassword(String userID, String newPW) {
        int result = 0;
        //String sql ="select * from member where userid=? and userpw = ?";
        String sql ="update member set userpw = ? where userid = ?";
        String salt = BCrypt.gensalt();
        String encodePW = BCrypt.hashpw(newPW,salt);
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,encodePW);
            pstmt.setString(2,userID);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            this.close();
        }
        return result;
    }
}
