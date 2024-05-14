package com.jjang051.jsp05.dto;

public class MemberDto {
    private int age;
    private String name;
    private String userID;
    private String userPW;

    public MemberDto(int age, String name, String userID, String userPW) {
        this.age = age;
        this.name = name;
        this.userID = userID;
        this.userPW = userPW;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPW() {
        return userPW;
    }

    public void setUserPW(String userPW) {
        this.userPW = userPW;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "age=" + age +
                ", name='" + name + '\'' +
                ", userID='" + userID + '\'' +
                ", userPW='" + userPW + '\'' +
                '}';
    }
}
