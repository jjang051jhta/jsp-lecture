package com.jjang051.mybatis.dto;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchDto {
    private String search;
    private String searchWord;
}
