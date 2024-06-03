package com.jjang051.mybatis.filter;

import com.jjang051.mybatis.utils.ScriptWriter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

//spring context안에서 동작하는 interceptor랑 조금 다르다 하지만 하는 역할은 비슷하다.
@WebFilter({"/board/*","/admin/*"})
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //로그인 안한 사람이면 무조건 login 으로 강제 이동
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        if(session.getAttribute("sessionID")!=null) {
            chain.doFilter(request,response);
        } else {
            HttpServletResponse resp = (HttpServletResponse)response;

            //resp.sendRedirect("../member/login");
            ScriptWriter
       .alertAndNext(resp,"로그인페이지로 이동합니다.",
               req.getContextPath()+"/member/login");
        }
    }

}
