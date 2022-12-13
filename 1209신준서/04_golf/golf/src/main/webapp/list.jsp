<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp" />
	<section>
		<h1>강사조회</h1>
		<table border="1">
			<tr>
				<td>강사코드</td><td>강사명</td><td>강의명</td><td>수강료</td><td>강사자격취득일</td>
			</tr>
			<%
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
				String sql = "SELECT * FROM TBL_TEACHER_202201";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					String date = rs.getString(5);
					date = date.substring(0, 4) + "년" + date.substring(4, 6) + "월" + date.substring(6, 8) + "일";
					
					String price = Integer.toString(rs.getInt(4));
					if(price.length() == 6)
						price = "\\" + price.substring(0, 3) + "," + price.substring(3, 6);
					else price = "\\" + price.substring(0, 2) + "," + price.substring(2, 5);
		%>
			<tr>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=price %></td>
				<td><%=date %></td>
			</tr>
		<%
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</section>
	<jsp:include page="footer.jsp" />
</body>
</html>