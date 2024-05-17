<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-16
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
  try {
    String sql = "delete from member where no = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.conn.setAutoCommit(false); // 오토커밋 끄기...
    String noList[] = request.getParameterValues("check");
    //한꺼번에 삭제할때는
    for (int i = 0; i < noList.length; i++) {
      //System.out.println(noList[i]);
      jdbcConnectionPool.pstmt.setInt(1, Integer.parseInt(noList[i]));
      jdbcConnectionPool.pstmt.addBatch(); //한번에 처리하기 위한 함수
      if(i==1) {
        //throw new Exception("알 수 없는 서버 오류");
      }
    }
    int result[] = jdbcConnectionPool.pstmt.executeBatch();
    System.out.println(Arrays.toString(result));
    jdbcConnectionPool.conn.commit();
    jdbcConnectionPool.conn.close();

  } catch (Exception e) {
    jdbcConnectionPool.conn.rollback();
    e.printStackTrace();
    jdbcConnectionPool.conn.close();

  } finally {
    // 무조건 실행하는 곳  autoCommit(false)
    jdbcConnectionPool.conn.setAutoCommit(true); // 다음번 들어오는건 autoCommit이 된다.
    jdbcConnectionPool.conn.close();
  }

%>