<%@page import="ateam.util.BihinUtil"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*,java.util.*,java.text.*, ateam.model.Bihin, ateam.model.User,ateam.model.Department"%>
<%@ page import="ateam.util.DepartmentUtil"%>
<%
    List<Bihin> list = (List<Bihin>) request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
<link rel="stylesheet" type="text/css" href="CSS/style.css">
<script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="js/jquery.floatThead.min.js"></script>

<title>マイページ</title>

</head>

<body>

	<%@ include file="menu.jsp"%>
	<style scoped>
    .margin {
	border: solid 1px #FFFFFF;
	margin: 10px;
    </style>

	<%
	    User user = (User) session.getAttribute("user");
	%>
	<h4>
		所属:<%
	    out.println(DepartmentUtil.getDeptName(user.getDeptID()));
	%>
	</h4>
	<h2><%=user.getUserName()%>さんのマイページ
	</h2>

	<h3>借りている備品一覧</h3>

    <div class="margin">
	    <table class="pure-table pure-table-striped bihinList">

		<%
		    if (list.size() != 0) {
		%>

		<thead>
			<tr>
				<th>備品ID</th>
				<th>備品名</th>
				<th>返却予定日</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>

			<%
			    for (int i = 0; i < list.size(); i++) {
								Bihin bihin = list.get(i);
			%>
			<tr>
				<td><%=bihin.getBihinID()%></td>
				<td><%=bihin.getBihinName()%></td>
				<td <%if (BihinUtil.isOverdue(bihin)) {%>
					class="text_overdue" <%}%>><%=bihin.getReturnDay()%></td>
				<td>
					<form method="POST" action="ReturnBihinServlet"
						onsubmit="return submitChk()" accept-charset="UTF-8">
						<input type="hidden" name="userID" value="<%=bihin.getUserID()%>">
						<input type="hidden" name="bihinID"
							value="<%=bihin.getBihinID()%>">

						<script>
							/**
							 * 確認ダイアログの返り値によりフォーム送信
							 */
							function submitChk() {
								/* 確認ダイアログ表示 */
								var flag = confirm("返却してもよろしいですか？\n\n返却したくない場合は[キャンセル]ボタンを押して下さい");
								/* send_flg が TRUEなら送信、FALSEなら送信しない */
								return flag;
							}
						</script>
						<button type="submit" class="pure-button"
							style="border: 2px solid #04B431;">返却</button>



					</form>
				</td>
			</tr>
			<%
			    }
			%>
			<!-- forここまで -->
		</tbody>
	    </table>
	</div>
	<%
	    } else {
	%>
	<font size="5">現在借りている備品はありません</font>
	<%
	    }
	%>

	<script type="text/javascript">
		var $table = $('table.bihinList');
		$table.floatThead();
	</script>

	<!--  <a href="LogoutServlet">ログアウト</a>
 <br>
 <a href = "BihinListServlet">備品一覧へ（貸出はこちらから）</a>  -->


</body>
</html>
