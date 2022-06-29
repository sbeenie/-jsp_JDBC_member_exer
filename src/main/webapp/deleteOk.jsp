<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 완료</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");//한글깨짐 방지
		
		String mid = request.getParameter("userId");		
		
		String sql = "DELETE FROM testmember WHERE id = '"+mid+"'";
		
		//data source 설정
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "asdqwe1231";
		
		Connection conn = null;
		Statement stmt = null;
		
		try{
			Class.forName(driverName);//드라이버 로딩
			conn = DriverManager.getConnection(url, username, password);//데이터베이스 연동
			stmt = conn.createStatement();//sql을 실행해주는 statement 객체 생성
			
			int resultCheck = stmt.executeUpdate(sql);//SQL실행->1이 반환되면 성공, 아니면 실패
			
			if(resultCheck == 1){
				response.sendRedirect("deleteSucess.jsp");
			} else {
				response.sendRedirect("loginSucess.jsp");
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	
	%>
	
	
</body>
</html>