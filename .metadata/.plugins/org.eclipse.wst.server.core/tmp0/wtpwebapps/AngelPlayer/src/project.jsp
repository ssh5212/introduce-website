<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://unpkg.com/ress/dist/ress.min.css">
	<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- Menu Btn -->
	<script> $(function() { $("#menubtn").click(function(){ $("#menu").slideToggle(); }); }); </script>

	<link rel="stylesheet" href="initial.css">
	<link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="introduce.css">
	<link rel="stylesheet" href="project.css">
	<link rel="shortcut icon" href="../img/favicon.ico" type="image/x-icon" />
	<link rel="icon" href="../img/favicon.ico" type="image/x-icon" />
	
	<title>Shin`s Portfolio</title>
</head>
<body>
	<jsp:include page="/src/header.jsp" />

	
	
	
	<div class="jb-box">
		<div class="top-img">
			<img src="../img/portfolio.png" alt="" width="1920" height="auto">
		</div>

		<div class="jc-text">
			<p class="vtext-big">Project</p>
		  </div>
	</div>
	<div class="margin-box"></div>
	
	<%@ include file="dbconn.jsp" %>
	<%
		String projectId = request.getParameter("id");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from project where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, projectId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>		
	<div class="normal-box">
		<div class="about-box line-box">
			<div class="img-box">
			<!-- <img src="c:\upload\<%=rs.getString("p_fileName") %>" alt="" width="95%" height="auto"> -->
				<img src="../img/<%=rs.getString("p_fileName") %>" alt="" width="95%" height="auto">
			</div>

			<div class="about-box-0">
				<h1 class="normal-ntext margin-p" style="font-weight: bolder;"><%=rs.getString("p_id") %></h1>
			</div>

			<div class="about-box-1">
				<div class="about-box-31">
					<p class="normal-sltext margin-p" style="font-weight: bolder;" >???????????? ???</p>
				</div>
				<div class="about-box-32">
					<p class="normal-sltext margin-p" ><%=rs.getString("p_name") %></p>
				</div>
	
				<div class="about-box-31">
					<p class="normal-sltext margin-p" style="font-weight: bolder;" >?????? ??????</p>
				</div>
				<div class="about-box-32">
					<p class="normal-sltext margin-p" ><%=rs.getString("p_technique") %></p>
				</div> 
				
				<div class="about-box-31">
					<p class="normal-sltext margin-p" style="font-weight: bolder;" >?????? ??????</p>
				</div>
				<div class="about-box-32">
					<p class="normal-sltext margin-p" ><%=rs.getString("p_function") %></p>
				</div> 

				<div class="about-box-31">
					<p class="normal-sltext margin-p" style="font-weight: bolder;" >?????? ??? ?????? ??????</p>
				</div>
				<div class="about-box-32">
					<p class="normal-sltext margin-p" ><%=rs.getString("p_schedule") %></p>
				</div> 
				
				<div class="about-box-31">
					<p class="normal-sltext margin-p" style="font-weight: bolder;" >?????? ??????</p>
				</div>
				<div class="about-box-32">
					<p class="normal-sltext margin-p" ><%=rs.getString("p_epilogue") %></p>
				</div> 
			</div>
			<div class="normal-btn margin-h2">
				<button class="normal-btn-inner normal-sltext margin-h2" onclick="location.href='portfolio.jsp'">????????????</button>
			</div>
		</div>
	</div>
	
	<%
		}
		
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null) 
			conn.close();
	%>
	
	<jsp:include page="/src/footer.jsp" />
	<jsp:include page="/src/page_up_btn.jsp" />	
</body>
</html>