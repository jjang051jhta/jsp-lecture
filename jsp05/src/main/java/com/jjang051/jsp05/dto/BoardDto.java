package com.jjang051.jsp05.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDto {
    private int no;
    private String userID;
    private String userName;
    private String password;
    private String content;
    private String subject;
    private int hit;
    private String regDate;
}
