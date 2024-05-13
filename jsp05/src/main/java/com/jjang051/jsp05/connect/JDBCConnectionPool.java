package com.jjang051.jsp05.connect;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCConnectionPool {
    public Connection conn;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public JDBCConnectionPool() {
        try {
            Context initContext = new InitialContext();
            Context context = (Context) initContext.lookup("java:comp/env");
            DataSource  dataSource = (DataSource)context.lookup("dbcp_oracle");
            conn = dataSource.getConnection();
            System.out.println("dbConnectionPool connected");
        } catch (NamingException e) {
            System.out.println("naming error");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("sql error");
            throw new RuntimeException(e);
        }
    }
    public void close() {
        // pool 연결할 수 있는 것들 모아두기...
        try {
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
            System.out.println("jdbc disconnect");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
