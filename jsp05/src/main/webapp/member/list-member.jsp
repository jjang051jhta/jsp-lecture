<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.jjang051.jsp05.connect.JDBCConnectionPool" %>
<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-05-10
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*Class.forName("oracle.jdbc.OracleDriver");
    Connection conn =
            DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","jhta051","1234");*/
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();

    String sql = "select * from member order by no";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery(); // executeQuery의 리턴값은  resultSet
    /*if(rs.next()) {
        System.out.println(rs.getInt("no"));
        System.out.println(rs.getString("userId"));
        System.out.println(rs.getString("userPw"));
        System.out.println(rs.getString("username"));
        System.out.println(rs.getString("birth"));
    }*/
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1" width="800px">
        <thead>
            <tr>
                <th>no</th>
                <th>id</th>
                <th>name</th>
                <th>birth</th>
            </tr>
        </thead>
        <tbody>
            <%
                while(rs.next()){
                    out.println("<tr>");
                    out.println("<td>"+rs.getInt("no")+"</td>");
                    out.println("<td>"+rs.getString("userID")+"</td>");
                    out.println("<td>"+rs.getString("userName")+"</td>");
                    out.println("<td>"+rs.getString("birth")+"</td>");
                    out.println("</tr>");
                }
            %>
        </tbody>
    </table>
</body>
</html>
