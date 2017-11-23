package edu.etu.web;

import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;
import java.util.StringJoiner;


public class LogFilter implements Filter{

    private static Logger logger = Logger.getLogger(LogFilter.class);
    private ServletContext conteхt;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        conteхt = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        StringJoiner logStringJoiner = new StringJoiner("; ");

        String username = (String) httpRequest.getSession().getAttribute("username");
        if (username != null) {
            logStringJoiner.add("Username: " + username);
        } else {
            logStringJoiner.add("Unauthorized");
        }

        logStringJoiner.add("URL: " + httpRequest.getRequestURI());

        StringJoiner paramsJoiner = new StringJoiner("; ");
        for (Map.Entry<String, String[]> param : httpRequest.getParameterMap().entrySet()) {
            StringJoiner paramsValuesJoiner = new StringJoiner(", ");
            for (String paramValue : param.getValue()) {
                paramsValuesJoiner.add(paramValue);
            }
            paramsJoiner.add(param.getKey() + " : " + paramsValuesJoiner.toString());
        }
        logStringJoiner.add("Params: " + paramsJoiner.toString());

        logger.info(logStringJoiner.toString());

        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {

    }


}
