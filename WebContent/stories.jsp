<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stories</title>
<style>
#top3 {
	display: block;
}

.commentTop,.comment {
	height: 100px;
	width: 250px;
	margin: 10px;
	background-color: #ffffff;
	border-style:solid;
	border-width:1px;
	border-color: #ffffff;
	table-layout:fixed;
	overflow: auto;
}

.overflow {
    overflow: auto;
    text-overflow: ellipsis;
    white-space: pre-line;
}

#sep {
	height: 10px;
	background-color: #ABC5DE;
	margin: 10px;
}

.leftAlign {
	padding-left: 5px;
}

.rightAlign {
	text-align: right;
	padding-right: 5px;
}

.bg1 {
	background-color: #5EA0E2;
	color: #FFFFFF;
	font-weight:bold;
	font-size:120%;
	height: 20px;
}

.bg2 {
	background-color: #F3F8FC;
	height: 20px;
}

.bg3 {
	background-color: #D4E3F2;
	color: #FF0000;
	font-weight:bold;
	height: 20px;
}

.votelink {
	color:#FFFFFF;
	cursor: pointer;
} 

.votelink:hover {
	text-decoration:underline;
}

</style>
</head>
<body>

<div id="titleSpace">
	<jsp:include page="templates/header.jsp" />
</div>
 <div class="featured">
 <div class="heading">
	<h2>Top Stories</h2>
 </div>
 <div class ="content">
 			Here are the Top 3 stories (comments) displayed. Vote for your favourite stories below to make them reach a top place! <br/>
			<table>
				<tr>
					<td>
						<div id="top3">
							<table>
								<tr>
									<td>
										<table class="commentTop">
											<tr class="bg1">
												<td><h1 class="leftAlign">1</h1></td>
												<td id="1v" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="1comment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="1extra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="commentTop">
											<tr class="bg1">
												<td><h1 class="leftAlign">2</h1></td>
												<td id="2v" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="2comment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="2extra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="commentTop">
											<tr class="bg1">
												<td><h1 class="leftAlign">3</h1></td>
												<td id="3v" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="3comment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="3extra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td><div id="sep"></div></td>
				</tr>
				<tr>
					<td>
						<div id="random6">
							<table>
								<tr><td colspan="3">Vote for one of the 6 random stories below if you like them!</td></tr>
								<tr>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link1" onclick="vote(1)" class="leftAlign votelink">Vote up!</td>
												<td id="1rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="1rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="1rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link2" onclick="vote(2)" class="leftAlign votelink">Vote up!</td>
												<td id="2rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="2rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="2rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link3" onclick="vote(3)" class="leftAlign votelink">Vote up!</td>
												<td id="3rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="3rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="3rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link4" onclick="vote(4)" class="leftAlign votelink">Vote up!</td>
												<td id="4rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="4rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="4rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link5" onclick="vote(5)" class="leftAlign votelink">Vote up!</td>
												<td id="5rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="5rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="5rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
									<td>
										<table class="comment">
											<tr class="bg1">
												<td id="link6" onclick="vote(6)" class="leftAlign votelink">Vote up!</td>
												<td id="6rv" class="rightAlign bg3"></td>
											</tr>
											<tr>
												<td id="6rcomment" class="overflow leftAlign rightAlign"
													colspan="2"></td>
											</tr>
											<tr>
												<td id="6rextra" class="rightAlign bg2" colspan="2"></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
 <script src="js/stories.js">		
 </script>
 </div>
 <div id="footerSpace">
	<jsp:include page="templates/footer.jsp" />
</div>



</body>
</html>