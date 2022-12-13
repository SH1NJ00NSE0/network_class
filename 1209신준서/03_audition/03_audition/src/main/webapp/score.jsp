<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link href="style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section>
		<h2>멘토 점수 조회</h2>
		<form>
			<table border="1">
				<tr>
					<td>채점번호</td>
					<td>참가번호</td>
					<td>참가자명</td>
					<td>생년월일</td>
					<td>점수</td>
					<td>평점</td>
					<td>멘토명</td>
				</tr>
				<%
				request.setCharacterEncoding("UTF-8");
				try{
					
					Connection con = Util.getConnection();
					String sql=
						"SELECT po.serial_no, ar.artist_id, ar.artist_name,ar.birth,po.score, po.score,me.mento_name "+
						"FROM tbl_artist_201905 ar, tbl_mento_201905 me, tbl_point_201905 po "+
						"WHERE ar.artist_id = po.artist_id and me.mento_id=po.mento_id "+
						"ORDER BY po.serial_no";
					PreparedStatement pstmt = con.prepareStatement(sql);
					ResultSet rs = pstmt.executeQuery();
					while(rs.next()){
				 		String birth=rs.getString(4);
				 		String birth2=birth.substring(0,4) + "년" + birth.substring(4,6) + "월" + birth.substring(6,8)+"일";
				 		int score = rs.getInt(6);
				 		String grade;
				 		if(score>=90) grade="A";
				 		else if(score>=80) grade="B";
				 		else if(score>=70) grade="C";
				 		else if(score>=60) grade="D";
				 		else grade="F";
				%>
				 <tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=birth2 %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=grade %></td>
					<td><%=rs.getString(7) %></td>
				</tr>
				<% 
					}
				} catch(Exception e){
					e.printStackTrace();
				}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>