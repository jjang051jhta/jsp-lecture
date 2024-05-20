package com.jjang051.jspmodel2.connect;

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
        // jdbc connection  할때마다 연결
        try {
            Context initContext = new InitialContext();
            Context context = (Context)initContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource)context.lookup("dbcp_oracle");
            conn = dataSource.getConnection();
            System.out.println("db connection pool connected");
        } catch (NamingException e) {
            System.out.println("namin error");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("sql error");
            throw new RuntimeException(e);
        }
    }
    public void close() {
        try {
            if(rs!=null) rs.close();
            if(pstmt!=null) pstmt.close();
            if(conn!=null) conn.close();
            System.out.println("connection pool return");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

