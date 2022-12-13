<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");
Connection conn = null;

try{
    conn  = Util.getConnection();
    String sql ="UPDATE tbl_member_202205 SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? WHERE custno=?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, custname);
    pstmt.setString(2, phone);
    pstmt.setString(3, address);
    pstmt.setString(4, joindate);
    pstmt.setString(5, grade);
    pstmt.setString(6, city);
    pstmt.setString(7, custno);
    
    pstmt.executeUpdate();
%>
<jsp:forward page="list.jsp"></jsp:forward>
<%      
}
catch(Exception e) {
    e.printStackTrace();
}
%>