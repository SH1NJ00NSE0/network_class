<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2><b>참가자 목록 조회</b></h2>
		<form>
			<table border=1>
				<tr>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>생년월일</td>
					<td>성별</td>
					<td>특기</td>
					<td>소속사</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					Connection conn=Util.getConnection();
					String sql="SELECT * FROM tbl_artist_201905 ORDER BY artist_id";
					PreparedStatement pstmt=conn.prepareStatement(sql);
					ResultSet rs=pstmt.executeQuery();
					while(rs.next()){
						String birth=rs.getString(3);
						String birth2=birth.substring(0,4)+"년"+
							birth.substring(4,6)+"월"+
							birth.substring(6,8)+"일";
						String gender=rs.getString(4);
						if(gender.equals("F")) gender="여";
						else gender="남";
						String talent = rs.getString(5);
						if(talent.equals("1")) talent="보컬";
						else if(talent.equals("2")) talent="댄스";
						else talent="랩";
				%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=birth2 %></td>
					<td><%=gender %></td>
					<td><%=talent %></td>
					<td><%=rs.getString(6) %></td>
				</tr>
				<%
					}
				}
				catch(Exception e){
					e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>