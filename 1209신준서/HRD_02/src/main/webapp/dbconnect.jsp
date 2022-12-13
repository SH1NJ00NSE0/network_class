<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>데이터베이스 접속 : dbconnect.jsp</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%
try {
 String driverName = "oracle.jdbc.driver.OracleDriver";
 String dbURL = "jdbc:oracle:thin:@localhost:1521:XE";
 
 Class.forName(driverName);
 Connection con = DriverManager.getConnection(dbURL,"system","1234");
 out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
 con.close();
}
catch (Exception e) {
 out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
 out.println(e.getMessage());
 e.printStackTrace();
}
%>
</body>
</html>