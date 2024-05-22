package com.jjang051.jspmodel2.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class MemberDto {
    //롬복 적용해서 get/set 빈생성자 싹다 생성자 toString
    private int no;
    private String userID;
    private String userPW;
    private String userName;
    private String email;
    private int postCode;
    private String address;
    private String addressDetail;
    private String birth;
    private Grade grade;
}
