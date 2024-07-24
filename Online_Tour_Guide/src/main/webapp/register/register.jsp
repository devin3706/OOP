<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page import="java.sql.*" %>

<%
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String password = request.getParameter("password");

 try{
     Class.forName("com.mysql.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/tour_guide","root","rashi");
     Statement stm = con.createStatement();
     stm.executeUpdate("insert into users(name,email,password) values('"+name+"', '"+email+"', '"+password+"')");
     response.sendRedirect("success.html");
     
   }
 catch(Exception e){

	response.sendRedirect("errorr.html");
 }
 
 
 %>