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
<script>
   $(function(){
      if(${msg ne null}){
         alert('${msg}');
      };
      if($("#wdForm").submit(function(){
         if(!confirm("Å»Åð ÇÏ½Ã°Ú½À´Ï±î?")){
            return false;
         }
      }));
   })
</script>
<meta charset="EUC-KR">
<title>Á¦ÁÖGo È¸¿ø ¸¶ÀÌÆäÀÌÁö</title>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <div class="w3-center w3-large w3-margin-top">
            <h3>È¸¿ø Å»Åð</h3>
         </div>
         <div>
            <br />
            <form action="withdrawal.jeju" method="post" name="deleteform">
               <input type="hidden" name="userid" readonly value ="${login.userid}">
               <p>
                  <label>Password</label>
                  <input class="w3-input" type="password" name="password" required>
               </p>
               <p class="w3-center">
               
                  <button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">È¸¿ø Å»Åð</button>
<!--                   <a href="javascript:deleteform.submit()">[È¸¿øÅ»Åð]</a> -->
               </p>
            </form>
         </div>
      </div>
   </div>
</body>
</html>