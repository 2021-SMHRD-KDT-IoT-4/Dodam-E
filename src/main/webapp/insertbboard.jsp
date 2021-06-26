<%@page import="COM.Model.childDAO"%>
<%@page import="COM.Model.childDTO"%>
<%@page import="COM.Model.UserDAO"%>

<%@page import="COM.Model.FaqDTO"%>
<%@page import="COM.Model.FaqWriteDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="COM.Model.NoticeWriteDAO"%>
<%@page import="COM.Model.NoticeDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import = "COM.Model.UserDTO"%>  
<%@page import = "java.util.*" %>  

<!DOCTYPE HTML>
<!--
   Massively by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>Elements Reference - Massively by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="assets/css/main.css" />
      <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
   </head>
   <body class="is-preload">
   
   <%
   UserDTO info = (UserDTO)session.getAttribute("login_info");
   %>
   
	
		<article>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<a href="main.jsp" class="logo">Dodam E</a>
					</header>

				<!-- Nav -->
					<nav id="nav">
						<ul class="links">
							<%if(info == null) { %>
							<li><a href="main.jsp">Dodam E</a></li>
							<li><a href="join.jsp">Join</a></li>
							<li><a href="login.jsp">Login</a></li>
							<%}else{ %>
							<%if(info.getId().equals("admin")) { %>
							<li><a href = "admin_userinfo.jsp">user info</a></li>
							<li><a href = "sendview.jsp">send</a></li>
							<%}else{ %>
							<li><a href="mypage.jsp">My Page</a></li>
							<li><a href="child.jsp">Child Sign Up</a></li>
							<li><a href="route.jsp">Route</a></li>
							<%}%>
							<li><a href="faq.jsp">FAQ</a></li>
							<li class="active"><a href="board.jsp">Board</a></li>
							<%}%>
						</ul>
						<ul class="icons">
							<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
						</ul>
					</nav>
					
					


               
			<div id="main">
			
			<article id="FAQ" class="panel">
               			
               			
                       <body>

                     <%
                        NoticeWriteDAO Noticedao = new NoticeWriteDAO();
                     %>
               
               <section class="article-detail table-common con row" style = "width:70%; margin-left : 15%;  display: block;">
                  <form action="InsertBoard">
                     <table class="cell" border="1">
                        <colgroup>
                           <col width="100px">
                        </colgroup>
                        <tbody>
                           <tr class="col-6 col-6-medium"
								style="margin: 0 auto; float: none;">
                              <th>제목 :</th>
                              <td colspan="3" width="200"><input type="text" name="title"></td>
                           </tr>
                           
                           <tr class="col-6 col-6-medium"
								style="margin: 0 auto; float: none;">
                              <th>작성자 :</th>
                              <td colspan="3" width="200"><input type="text" name="writer"></td>
                           </tr>
                           
                           <tr class="col-6 col-6-medium"
								style="margin: 0 auto; float: none;">
                              <th>내용 :</th>
                              <td colspan="3"><textarea name="content"></textarea></td>
                           </tr>
                           
                           <tr class="col-6 col-6-medium"
								style="margin: 0 auto; float: none;">
                              <td colspan="4"></td>
                           </tr>
                        </tbody>
                     </table>
                     
                       <div class="row" style="display: block;">
                  		<div class="col-3 col-6-medium" style="margin: 0 auto; float: none;">
                          <button><a href="board.jsp">뒤로가기</a></button>
                        <input type = "submit" value = "작성하기">
                        </div>   
               	        </div>
               	        
               	      

                          
                  </form>

               </section>
              
               </article>
            </body>
                              

         

            

            <!-- Copyright -->
               <div id="copyright">
                  <ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
               </div>

         </div>

      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

   </body>
</html>