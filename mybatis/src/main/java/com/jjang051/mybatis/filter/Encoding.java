package com.jjang051.mybatis.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*")
public class Encoding implements Filter {
    private String encoding = "UTF-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("encoding filter init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("filtering~~~~");
        if(request.getCharacterEncoding()==null) {
            request.setCharacterEncoding(encoding);
            System.out.println("utf-8 encoding");
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
        System.out.println("encoding filter destroy");
    }
}
