package edu.etu.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Xtail on 01.10.17.
 */
public class ItemCard extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String value = getInitParameter("activeTab");

        out.println(getPageContent(value));
        out.close();
    }

    private String getPageContent(String value) {
        String html = "<html><body> " +
                "<h1>Hello World!</h1>" + value +
                "</body></html>";

        return html;
    }
}