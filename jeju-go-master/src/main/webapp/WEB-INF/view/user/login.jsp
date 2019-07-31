<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <div class="recent">
                <h2 class="widgetheading" style="text-align: center;">Login</h2>
           </div>
         <div>
            <br />
            <form id= "wdForm" action="login.jeju" method="post">
               <p>
                  <label>ID(E-Mail)</label>
                  <input class="w3-input" type="text"  name="userid" style="text-transform: lowercase;">
               </p>
               <p>
                  <label>Password</label>
                  <input class="w3-input" type="password" name="password" style="text-transform: lowercase;">
               </p>
               <p class="w3-center">
                  <button type="submit" id="joinBtn" class="btn btn-primary">로그인</button>
               </p>
            </form>
         </div>
      </div>
   </div>
</body>
</html> 