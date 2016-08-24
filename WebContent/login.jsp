<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<% String errorMessage = (String) request.getAttribute("errorMessage");%>

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ログイン</title>
    <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  </head>
  <body>
<h1>備品管理</h1>
<br>
   <h2>ログイン</h2>


    <% if(errorMessage != null){ %>
    <% out.println(errorMessage);%>
    <% }%>
    <br>
    <br>

      <form method="POST" action="LoginServlet" accept-charset="UTF-8" class="pure-form">
      ユーザーID : <input type="text" name="userID"><br><br>
      パスワード : <input type="password" name="password"><br><br>
      <!-- <input type="submit" value="送信"> -->
      <!-- <input type="reset" value="リセット"> -->
      <button type="submit" class="pure-button pure-button-primary">送信</button>
      <button type="reset" class="pure-button pure-button-primary">リセット</button>
    </form>
  </body>
</html>