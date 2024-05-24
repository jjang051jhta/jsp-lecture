package com.jjang051.jspmodel2.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class BoardDto {
    private int no;
    private String subject;
    private String content;
    private String userID;
    private String userName;
    private String password;
    private int hit;
    private String regDate;
}
