<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><s:text name="title.index" /></title>

</head>
<body>
<div id="titleSpace">
	<jsp:include page="templates/header.jsp" />
</div>

<!--------------Slideshow--------------->

<section class="featured">
	<div class="rslides_container">
		<ul class="rslides" id="slider">
			<li><img src="images/euro1.png"/></li>
			<li><img src="images/euro2.jpg"/></li>
			<li><img src="images/euro3.jpg"/></li>
		</ul>
	</div>
</section>
			
<!--------------Content--------------->
<section id="content">
	<div class="zerogrid">
		<div class="row">
			<div class="main-content">
				<div class="row">
					<div class="col-1-3">
						<section>
							
						</section>
					</div>
				</div>
				
				<div class="row">
					<div class="col-2-3">
						<article>
							<div class="story">
							
							<h2> What is our story? </h2>
								<p>
								Have you ever wondered where the money you have today come from. Who has used them before? How did they get them? Our site is for those as curious as you! 
								</p>
								<p>
								Here is an example story, of how someone might use our site.   
								</p>
								<p>
								You go to a supermarket, you buy some things for home, and receive a paper money bill with our link on it, as a change. You are being curious of what is on this web-site and you check on it. There you see where this bill has been before. You see there are different places in Europe, and the people who owned it before had left their personal message on it. You like the idea so much that you'd like you leave your mark on it too. Further more, you'd like to start tracking your own bills, and then see where they are going. 
								</p> 
								<p>
								Some ideas that come up to you, it is putting the bill inside a bottle and let it go in the river, or the ocean, so it can be found on other continents after a while. Use your imagination, be as creative as you want to. 
								</p>
								<p>
								See the stories of our users and check at what interesting places people have found the bills. Rate them up, if you like them. 
								</p>
								<p>
								We wish you a pleasant tracking. 
								</p>
							</div>
						</article>
					</div>
					<div class="sidebar col-1-3">
						<section class="">
							<div class="heading">Serial Number of the Bill?</div>
							<div class="content">
								<div id="searchBillSpace">
	                             <jsp:include page="templates/searchBill.jsp" />
                                </div>
							</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>




<div id="footerSpace">
	<jsp:include page="templates/footer.jsp" />
</div>

<%-- <script type="text/javascript">
	alert("test");
	var API = "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-sdmx.xml";
	$(document).ready(function() {
		$.ajax({
			type: "GET",
			url: API,
			dataType: "xml",
			success: function(xml) {
				parse(xml);
			}
		});
	});
	
	function parse(xml) {
		$(xml).find().each(function() {
			
		})
	}
</script> --%>


</body>
</html>