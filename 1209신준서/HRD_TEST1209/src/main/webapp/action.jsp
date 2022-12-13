<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
<%
 request.setCharacterEncoding("UTF-8");
 Connection conn = null;
 Statement stmt = null;
 String mode = request.getParameter("mode");
 String custno = request.getParameter("custno");
 String custname = request.getParameter("custname");
 String phone = request.getParameter("phone");
 String address = request.getParameter("address");
 String joindate = request.getParameter("joindate");
 String grade = request.getParameter("grade");
 String city = request.getParameter("city");
 try{
conn = Util.getConnection();
String sql = "";
switch(mode){
case "insert":
	sql = "INSERT INTO tbl_member_202205 VALUES(?,?,?,?,TO_DATE(?,'yyyy-mm-dd'),?,?)";

PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1,custno);//?
pstmt.setString(2,custname);
pstmt.setString(3,phone);
pstmt.setString(4,address);
pstmt.setString(5,joindate);
pstmt.setString(6,address);
pstmt.setString(7,city);
   pstmt.executeUpdate(); //update수 return 가능
%>
  <jsp:forward page="join.jsp"></jsp:forward>
  <% 	
  break;
  case "modify":
  	sql ="UPDATE tbl_member_202205 SET custname=?, phone=?, address=?, joindate= TO_DATE(?, 'yyyy-MM-dd'), grade=?, city=? WHERE custno=?";
  	pstmt = conn.prepareStatement(sql);
  	pstmt.setString(1, custname);
  	pstmt.setString(2, phone);
  	pstmt.setString(3, address);
  	pstmt.setString(4, joindate);//
  	pstmt.setString(5, grade);
  	pstmt.setString(6, city);
  	pstmt.setString(7, custno);
  	
  	pstmt.executeUpdate();
  	
  			 
  	%>
  	 <jsp:forward page="list.jsp"></jsp:forward>
  	 <%
    	 break;
    	}
 	}
  	
catch(Exception e){
	e.printStackTrace();
}
%>
%>
</body>
</html>