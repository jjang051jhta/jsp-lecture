package com.jjang051.mybatis.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
public enum Grade {
    //열거형 제한  getter , 속성을 가지는 생성자
    MEMBER("member"),
    MANAGER("manager"),
    ADMIN("admin");
    private final String label;
}
