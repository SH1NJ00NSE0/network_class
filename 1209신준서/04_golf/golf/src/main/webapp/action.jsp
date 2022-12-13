<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String mode = request.getParameter("mode");
String month = request.getParameter("month");
String cname = request.getParameter("cname");
String cno = request.getParameter("cno");
String area = request.getParameter("area");
String tcode = request.getParameter("tcode");
String price = request.getParameter("price");

System.out.println(area);

try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	Statement stmt = con.createStatement();


	switch(mode) {
	case "insert":
		String sql = String.format("insert into tbl_class_202201 values( '%s','%s', '%s', %d, '%s')", month,cno, area,Integer.parseInt(price),tcode);
		int rs = stmt.executeUpdate(sql);
		%>
		<jsp:include page="list2.jsp"></jsp:include>
		<%
		break;
	}
	
	stmt.close();
	con.close();

}catch(Exception e) {
	e.printStackTrace();
}
%>
</body>
</html>