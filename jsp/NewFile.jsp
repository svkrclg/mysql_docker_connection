<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try{   
	String data=request.getParameter("data");
    java.sql.Connection con;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://mysql03/"+"wrk", "root", "123456");
    PreparedStatement ps=con.prepareStatement("insert into inputs(data) values(?)");
    ps.setString(1,data);
    ps.execute();
    System.out.println("success");
 } catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
      
   

%>
</body>
</html>
