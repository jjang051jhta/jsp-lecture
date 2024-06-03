package com.jjang051.mybatis.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberDto {
    private int num;
    private int no;
    private String userID;
    private String userPW;
    private String userName;
    private String userEmail;
    private int postCode;
    private String address;
    private String addressDetail;
    private String grade;
    private String birth;
    private String originalProfile;
    private String renameProfile;
}

