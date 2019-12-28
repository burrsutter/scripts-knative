package com.redhat.developer.demos.sbeventinghello;

import java.io.IOException;
import java.util.Enumeration;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;
  private int cnt;
  
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    System.out.println("MyServlet's doGet() method is invoked.");
    handleRequest(req, resp);
  }
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    System.out.println("MyServlet's doPost() method is invoked.");
    handleRequest(req, resp);
  }
  
  private void handleRequest(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {

    // Gather all HTTP Headers
    StringBuffer headers = new StringBuffer();
    String header;
    for (Enumeration<String> e = req.getHeaderNames(); e.hasMoreElements();) {
      header = e.nextElement();
      headers.append(header + "=" + req.getHeader(header) + "\n");
    }
    // System.out.println("HTTP Headers");
    // System.out.println(headers.toString());
    
    // Inspect just the important CloudEvents headers
    System.out.println("ce-id=" + req.getHeader("ce-id"));
    System.out.println("ce-source=" + req.getHeader("ce-source"));
    System.out.println("ce-specversion=" + req.getHeader("ce-specversion"));
    System.out.println("ce-time=" + req.getHeader("ce-time"));
    System.out.println("ce-type=" + req.getHeader("ce-type"));
    System.out.println("content-type=" + req.getContentType());
    System.out.println("content-length=" + req.getContentLengthLong());

    // POST'd body
    if ("POST".equalsIgnoreCase(req.getMethod())) 
    {
      String body = req.getReader().lines().collect(Collectors.joining(System.lineSeparator()));
      System.out.println("POST:" + body);
    }
    
    resp.setContentType("application/json");
    resp.getWriter().write("{\"hello\": \"world-" + cnt++ + "\"}");
  }
  
}