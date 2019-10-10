<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>${cvInfo.fullName} - Curriculum Vitae</title>

<meta name="viewport" content="width=device-width" />
<meta name="description" content="The Curriculum Vitae of Joe Bloggs." />
<meta charset="UTF-8">

<link type="text/css" rel="stylesheet" href="css/final_cv.css">
<script src="https://kendo.cdn.telerik.com/2017.2.621/js/jquery.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/2017.2.621/js/jszip.min.js"></script>
	<script
	src="https://kendo.cdn.telerik.com/2017.2.621/js/kendo.all.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300'
	rel='stylesheet' type='text/css'>
	
 <title></title>
    <!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> -->
</head>
<body id="top">
	<div id="action-content" class="action-content">
	  <%-- <form action="${pageContext.request.contextPath}/downloadPDF" method="post"> --%>
	    <a class="button-decotation back-a" id="back" href="${pageContext.request.contextPath}/backToEdit">Edit</a>
		<button type="submit" class="button-decotation" id="downloadPDF" onclick="ExportPdf('${cvInfo.fullName}')">Download PDF</button>
	  <!-- </form> -->	
	</div>
	<div id="cv" class="instaFade">
		<div class="mainDetails">
			<div id="name">
				<h1 class="quickFade delayTwo">${cvInfo.fullName}</h1>
				<h2 class="quickFade delayThree">
					${cvInfo.address1}, <br>${cvInfo.address2}
				</h2>
			</div>

			<div id="contactDetails" class="quickFade delayFour">
				<ul>
					<li><b class="sub-heading-font">E-mail:</b> <a
						href="mailto:${cvInfo.email}" target="_blank">${cvInfo.email}</a></li>
					<li><b class="sub-heading-font">Website:</b> 
						<c:forEach var="website" items="${cvInfo.websites}">
               			<c:if test="${not empty website}">
               				<a href="${website}" target="_blank" class="anchor_decoration">${website}</a><br/>
               			</c:if>
            		  </c:forEach>
					</li>
					<li><b class="sub-heading-font">Mob:</b> 
						<c:forEach var="phone" items="${cvInfo.phoneNos}">
             		  		<c:if test="${not empty phone}">
              			 		${phone}<br/>
                	  	</c:if>
            		</c:forEach> 
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<div id="mainArea" class="quickFade delayFive">
			<section>
				<article>
					<div class="sectionTitle">
						<h1>Personal Profile</h1>
					</div>

					<div class="sectionContent">
						<p>
							<c:forEach var="summary" items="${cvInfo.profileSummaries}">
               				# ${summary}<br/>
            				</c:forEach>
						</p>
					</div>
				</article>
				<div class="clear"></div>
			</section>


			<section>
				<div class="sectionTitle">
					<h1>Work Experience</h1>
				</div>

				<div class="sectionContent">
					<c:forEach var="employement" items="${cvInfo.employements}">
						<article>
							<h2>${employement.designation} at ${employement.organisation}</h2>
							<p class="subDetails">
								<c:if test="${employement.currentCompany}">
           				 			(${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - Present)
           				 		</c:if>
           				  		<c:if test="${!employement.currentCompany}">
           				 			(${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - ${employement.monthWorkingTill} ${employement.yearWorkingTill})
           				 		</c:if>
							</p>
							<p>
							  <c:forEach var="desc" items="${employement.descriptions}">
           				 	 	# ${desc}.<br>
           				 	   </c:forEach>
							</p>
						</article>
					</c:forEach>
				</div>
				<div class="clear"></div>
			</section>


			<section>
				<div class="sectionTitle">
					<h1>Key Skills</h1>
				</div>

				<div class="sectionContent">
					<ul class="keySkills">
					   <c:forEach var="skill" items="${cvInfo.skills}">
						<li>${skill}</li>
					   </c:forEach>	
					</ul>
				</div>
				<div class="clear"></div>
			</section>


			<section>
				<div class="sectionTitle">
					<h1>Education</h1>
				</div>

				<div class="sectionContent">
					<c:forEach var="education" items="${cvInfo.educations}">
						<article>
							<h2>${education.institute}</h2>
							<c:if test="${education.gpa}">
									<p class="subDetails">${education.education} (${education.specialization}) with ${education.percentage} CGPA in the year ${education.passoutYear}</p>
								</c:if>
								<c:if test="${!education.gpa}">
									<p class="subDetails">${education.education} (${education.specialization}) with ${education.percentage}% in the year ${education.passoutYear}</p>
							</c:if>
						</article>
					</c:forEach>
				</div>
				<div class="clear"></div>
			</section>
			
			<c:forEach items="${cvInfo.newSummary}" var="summary">
			 	<section>
			 		<div class="sectionTitle">
						<h1>${summary.key}</h1>
					</div>
					<div class="sectionContent">
					<article>
						<p class="subDetails">${summary.value}</p>
					</article>
				</div>
			 	</section>
			 </c:forEach>

		</div>
	</div>

	
	<%@include file="pdf_template_1.jsp"%>
	<script type="text/javascript">
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl."
				: "http://www.");
		document
				.write(unescape("%3Cscript src='"
						+ gaJsHost
						+ "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script type="text/javascript">
		var pageTracker = _gat._getTracker("UA-3753241-1");
		pageTracker._initData();
		pageTracker._trackPageview();
	</script>
	<script type="text/javascript" src="js/util.js"></script>
</body>
</html>