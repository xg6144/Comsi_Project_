<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/custom.css">
	<title>::메인페이지::</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		//로그인 세션 관리 
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">협업</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a>
			</ul>
			<%
				if(userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">시작하기<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="login/login.jsp">Login</a></li>
						<li><a href="join/join.jsp">Register</a></li>
					</ul>
				</li>
			</ul>
			<%
				}else{
			%>
				<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Menu<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">File UpLoad</a></li>
						<li><a href="join.jsp">Chat</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container">
		<form method="post" action="./userRegister">
			<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"><h4>회원가입</h4></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 110px;"><h5>아이디</h5></td>
						<td><input class="form-control" type="text" id="userID" name="userID" maxlength="20" placeholder="아이디를 입력하세요."></td>
						<td style="width:110px;"><button class="btn btn-primary" onclick="registerCkFunction();" type="button">중복확인</button>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호</h5></td>
						<td colspan="2"><input onkeyup="passwordCKFunction()" class="form-control" type="password" id="userPwd1" name="userPwd1" maxlength="20" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>비밀번호 확인</h5></td>
						<td colspan="2"><input onkeyup="passwordCKFunction()" class="form-control" type="password" id="userPwd2" name="userPwd2" maxlength="20" placeholder="비밀번호를 다시 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이름</h5></td>
						<td colspan="2"><input class="form-control" type="text" id="userName" name="userName" maxlength="20" placeholder="이름을 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>나이</h5></td>
						<td colspan="2"><input class="form-control" type="number" id="userAge" name="userAge" maxlength="3" placeholder="나이를 입력하세요."></td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>성별</h5></td>
						<td colspan="2">
							<div class="form-group" style="text-align: center; margin:0 auto;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="userGender" autocomplete="off" value="여자">여자 
									</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td style="width: 110px;"><h5>이메일</h5></td>
						<td colspan="2"><input class="form-control" type="email" id="userEmail" name="userEmail" maxlength="50" placeholder="이메일을 입력하세요."></td>
					</tr>
				</tbody>	
			</table>
		</form>
	</div>
</body>
</html>