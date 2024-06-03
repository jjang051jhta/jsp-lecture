package com.jjang051.mybatis.filter;

import jakarta.servlet.*;

import java.io.IOException;

public class BasicFilter implements Filter {
    FilterConfig config;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        config= filterConfig;
        String filterName =  filterConfig.getFilterName();
        System.out.println("encoding filter init call==="+filterName);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //여기가 핵심
        System.out.println("doFilter call");
        String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
        System.out.println("encodingFilter init param==="+filterInitParam);
        chain.doFilter(request,response);
        System.out.println("jsp call after");
    }

    @Override
    public void destroy() {
        System.out.println("encoding filter destroy call");
    }
    //

}
