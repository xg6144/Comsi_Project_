<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.InitialContext, javax.naming.Context"%>
<%
	InitialContext initCtx = new InitialContext();
	Context context = (Context) initCtx.lookup("java:/comp/env");
	DataSource ds = (DataSource) context.lookup("jdbc/HyubUpWebApp");
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT VERSION()");
	while(rs.next()){
		out.println("MYsql Version : " + rs.getString("version()"));
		
	}
	rs.close();
	stmt.close();
	conn.close();
	initCtx.close();
%>
</body>
</html>