<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String userID = request.getParameter("userID");
	String user_pwd1 = request.getParameter("userPwd1");
	String user_pwd2 = request.getParameter("userPwd2");
	String user_name = request.getParameter("userName");
	String user_age = request.getParameter("userAge");
	String user_gender = request.getParameter("userGender");
	String user_email = request.getParameter("userEmail");
	String user_profile = request.getParameter("userProfile");
	
	if(userID == null || userID.equals("") || user_pwd1 == null || user_pwd1.equals("") ||
			user_pwd2 == null || user_pwd2.equals("") || user_name == null || user_name.equals("")
			|| user_age == null || user_age.equals("") || user_gender == null || user_gender.equals("") || user_email == null || user_email.equals("")) {
		request.getSession().setAttribute("messageType", "Error");
		request.getSession().setAttribute("messageContent", "비어있는 칸이 있습니다.");
		response.sendRedirect("./join.jsp");
		return;
	}
	if(!user_pwd1.equals(user_pwd2)) {
		request.getSession().setAttribute("messageType", "Error");
		request.getSession().setAttribute("messageContent", "비밀번호가 다릅니다.");
		response.sendRedirect("./join.jsp");
	}
	
	int result = new UserDAO().register(userID, user_pwd1, user_profile, user_name, user_age, user_gender, user_email);
	
	if(result == 1) {
		request.getSession().setAttribute("messageType", "success");
		request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
		response.sendRedirect("../index.jsp");
	}
	else {
		request.getSession().setAttribute("messageType", "Error");
		request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
		response.sendRedirect("./join.jsp");
	}
%>
</body>
</html>