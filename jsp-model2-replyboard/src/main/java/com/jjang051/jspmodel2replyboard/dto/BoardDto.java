package com.jjang051.jspmodel2replyboard.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDto {
    private int no;
    private String userID;
    private String userName;
    private String subject;
    private String content;
    private String password;
    private int regroup;
    private int relevel;
    private int restep;
    private int hit;
    private String regDate;
    private int available;
}
