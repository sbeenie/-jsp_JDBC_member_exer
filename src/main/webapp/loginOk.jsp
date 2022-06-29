<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%	
		String id;
		String pw;
		String name;
		String email;
		String phone;
		String gender;
	
		request.setCharacterEncoding("utf-8");//한글깨짐 방지
		
		String mid = request.getParameter("userId");
		String mpw = request.getParameter("userPw");
		
		//data source 설정
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "asdqwe1231";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM testmember WHERE id = '"+mid+"' AND pw = '"+mpw+"'";
		
		try{
			
			
			Class.forName(driverName);//드라이버 로딩
			conn = DriverManager.getConnection(url, username, password);//데이터베이스 연동
			stmt = conn.createStatement();//sql을 실행해주는 statement 객체 생성
			
			rs = stmt.executeQuery(sql);			
	
			int loginFlag = 0;
			
			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				phone = rs.getString("phone");
				gender = rs.getString("gender");
				System.out.println("아이디:"+ id);
				session.setAttribute("name", name);
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				loginFlag++;
			}
			
			if(loginFlag == 0) {
				response.sendRedirect("login.jsp");
			} else {			
				response.sendRedirect("loginSucess.jsp");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs != null) {
					rs.close();
				}
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