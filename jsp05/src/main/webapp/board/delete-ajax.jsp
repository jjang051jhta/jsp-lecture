<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="com.jjang051.jsp05.utils.ScriptWriter" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-17
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no =  Integer.parseInt(request.getParameter("no"));
    String sql = "delete from board where no = ?";
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1, no);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    response.setContentType("application/json; charset=utf-8");
    String msg = null;
    if(result>0) {
        msg = "yes";
    } else {
        msg="no";
    }
    //rest api
    Map<String,String> resultMap = new HashMap<>();
    resultMap.put("isDelete",msg);  //  front   no,
    Gson gson = new Gson();
    String resultJson = gson.toJson(resultMap);
    out.println(resultJson);  //{"isDelete":"yes"}
    jdbcConnectionPool.close();
%>