<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<title>${cvInfo.fullName} - CV</title>
<style>
.clear {
	clear: both;
}

p {
	font-size: 1em;
	line-height: 1.4em;
	margin-bottom: 20px;
	color: #444;
}

.mainDetails1 {
	padding: 25px 35px;
	border-bottom: 2px solid #cf8a05;
}

#name1 h1 {
	font-size: 2.5em;
	font-weight: 700;
	font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
	margin-bottom: -6px;
}

#name1 h2 {
	font-size: 1.5em;
	margin-left: 2px;
	font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
}

#mainArea1 {
	padding: 0 30px;
}

#name1 {
	float: left;
	/* margin-top: -30px; */
}

#contactDetails1 {
	float: right;
	margin-top: 5px;
	font-size: 18px;
	font-family: 'Lato', helvetica, arial, sans-serif;
}

#contactDetails1 ul {
	list-style-type: none;
	font-size: 0.9em;
	margin-top: 2px;
}

#contactDetails1 ul li {
	margin-bottom: 3px;
	color: #444;
}

#contactDetails1 ul li a, a[href^=tel] {
	color: #444;
	text-decoration: none;
	-webkit-transition: all .3s ease-in;
	-moz-transition: all .3s ease-in;
	-o-transition: all .3s ease-in;
	-ms-transition: all .3s ease-in;
	transition: all .3s ease-in;
}

#contactDetails1 ul li a:hover {
	color: #cf8a05;
}

section {
	border-top: 1px solid #9e9c9c;
}

section:first-child {
	border-top: 0;
}

/* section:last-child {
	padding: 20px 0 10px;
} */

.sectionContent1 {
	text-align: justify;
	/* margin-top: -18px; */
	font-size: 16px;
	font-family: 'Lato', helvetica, arial, sans-serif;
	color: #444;
}

.sectionTitle1 {
	margin-top: -9px;
}

.sectionTitle1 h1 {
	font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
	font-style: italic;
	font-size: 1.5em;
	color: #cf8a05;
}

.sectionContent1 h2 {
	font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
	font-size: 1.5em;
	margin-bottom: -2px;
}

.subDetails1 {
	font-size: 0.8em;
	font-style: italic;
	margin-bottom: 3px;
	float: right;
}

.instaFade1 {
	-webkit-animation-name: reset, fade-in;
	-webkit-animation-duration: 1.5s;
	-webkit-animation-timing-function: ease-in;
	-moz-animation-name: reset, fade-in;
	-moz-animation-duration: 1.5s;
	-moz-animation-timing-function: ease-in;
	animation-name: reset, fade-in;
	animation-duration: 1.5s;
	animation-timing-function: ease-in;
}

.quickFade1 {
	-webkit-animation-name: reset, fade-in;
	-webkit-animation-duration: 2.5s;
	-webkit-animation-timing-function: ease-in;
	-moz-animation-name: reset, fade-in;
	-moz-animation-duration: 2.5s;
	-moz-animation-timing-function: ease-in;
	animation-name: reset, fade-in;
	animation-duration: 2.5s;
	animation-timing-function: ease-in;
}

.delayTwo1 {
	-webkit-animation-delay: 0, 1s;
	-moz-animation-delay: 0, 1s;
	animation-delay: 0, 1s;
}

.delayThree1 {
	-webkit-animation-delay: 0, 1.5s;
	-moz-animation-delay: 0, 1.5s;
	animation-delay: 0, 1.5s;
}

.delayFour1 {
	-webkit-animation-delay: 0, 2s;
	-moz-animation-delay: 0, 2s;
	animation-delay: 0, 2s;
}

.delayFive1 {
	-webkit-animation-delay: 0, 2.5s;
	-moz-animation-delay: 0, 2.5s;
	animation-delay: 0, 2.5s;
}

.sub-heading-font1 {
	font-weight: 600;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
}

td, th {
	border: 1px groove #dddddd;
	text-align: left;
	padding: 8px;
}

.header2{
	font-size: 1.2em;
	font-family: 'Rokkitt', Helvetica, Arial, sans-serif;
}
</style>
</head>
<body>
	<div id="cv123" class="instaFade1" hidden="true">
		<div class="mainDetails1">
			<div id="name1">
				<h1 class="quickFade1 delayTwo1">${cvInfo.fullName}</h1>
				<h2 class="quickFade1 delayThree1">
					${cvInfo.address1}, <br />${cvInfo.address2}
				</h2>
			</div>

			<div id="contactDetails1" class="quickFade1 delayFour1">
				<ul>
					<li><b class="sub-heading-font1">E-mail:</b> <a
						href="mailto:${cvInfo.email}" target="_blank">${cvInfo.email}</a></li>
					<li><b class="sub-heading-font1">Website:</b>
					  <c:forEach var="website" items="${cvInfo.websites}">
               			<c:if test="${not empty website}">
               				<a href="${website}" target="_blank" class="anchor_decoration">${website}</a><br/>
               			</c:if>
            		  </c:forEach>
					 </li>
					<li><b class="sub-heading-font1">Mob:</b>
					<c:forEach var="phone" items="${cvInfo.phoneNos}">
             		  <c:if test="${not empty phone}">
              			 ${phone}<br/>
                	  </c:if>
            		</c:forEach> 
					</li>
				</ul>
			</div>
			<div class="clear"></div>
		</div>

		<div id="mainArea1" class="quickFade1 delayFive1">
		<c:if test="${not empty cvInfo.profileSummaries}">
			<section>
				<article>
					<div class="sectionTitle1">
						<h1>Personal Profile</h1>
					</div>

					<div class="sectionContent1" style="margin-left: 13px;margin-bottom: 11px;">
						<c:forEach var="summary" items="${cvInfo.profileSummaries}">
               				# ${summary}<br/>
            			</c:forEach>
					</div>
				</article>
			</section>
			</c:if>
			<c:if test="${not empty cvInfo.employements}">
			<section>
				<div class="sectionTitle1">
					<h1>Work Experience</h1>
				</div>
				<div style="margin-top: -13px;">
				<c:forEach var="employement" items="${cvInfo.employements}">
					<h2 class="header2">
					${employement.designation} at ${employement.organisation}
						<span class="subDetails1">
							<c:if test="${employement.currentCompany}">
           				 		(${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - Present)
           				 	</c:if>
           				  	<c:if test="${!employement.currentCompany}">
           				 		(${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - ${employement.monthWorkingTill} ${employement.yearWorkingTill})
           				 	</c:if>
						</span>
					</h2>
					<div class="sectionContent1">
					<article>
						<br>
						<p style="margin-left: 13px;margin-top: -10px;">
							<c:forEach var="desc" items="${employement.descriptions}">
           				 	 	# ${desc}.<br>
           				 	 </c:forEach>
						</p>
					</article>
				</div>
				</c:forEach>
				</div>
			</section>
			</c:if>
			<c:if test="${not empty cvInfo.skills}">
			<section>
				<div class="sectionTitle1">
					<h1>Key Skills</h1>
				</div>

				<div class="sectionContent1"
					style="padding-bottom: 17px; padding-top: 10px; padding-left: 30px;">
					<table>
						<c:set var="next" scope="page" value="0"/>
						<c:forEach var = "i" begin = "0" end = "${fn:length(cvInfo.skills)/7}">
							<tr>
								<c:forEach var = "j" begin = "0" end = "6">
									<c:if test="${not empty cvInfo.skills[i+j+next]}">
									  <td>${cvInfo.skills[i+j+next]}</td>
									</c:if>
								</c:forEach>
							</tr>
							<c:set var="next" value="${next+6}"/>
						</c:forEach>
					</table>
				</div>
			</section>
			</c:if>
			<c:if test="${not empty cvInfo.projects}">
			<section>
				<div class="sectionTitle1">
					<h1>Projects</h1>
				</div>
				<div style="margin-top: -13px;">
				<c:forEach var="project" items="${cvInfo.projects}">
				<h2 class="header2">
					${project.projectName} (${project.clientName})
					<span
						class="subDetails1">
						(${project.fromDate} - ${project.toDate})
					</span>
				</h2><br/>
				<div class="sectionContent1">
					<article>
						<p style="margin-left: 13px;">
							<b>Environments: </b> ${project.usedSkills}<br /> 
							<b>Description:</b><br />
							${project.projectDescription}
							<br /> <strong style="font-weight: 600;">Roles &
								Responsibilities:</strong><br />
							<c:forEach var="respnb" items="${project.responsibilities}">
								# ${respnb}.<br>
							</c:forEach>	
						</p>
					</article>
				</div>
				</c:forEach>
				</div>
			</section>
			</c:if>
			<c:if test="${not empty cvInfo.educations}">
			<section>
				<div class="sectionTitle1">
					<h1>Education</h1>
				</div>
				<div style="margin-top:-13px" >
					<c:forEach var="education" items="${cvInfo.educations}">
						<h2 class="header2">${education.institute}</h2><br/>
						<div class="sectionContent1">
							<article style="margin-left: 13px;">
								<c:if test="${education.gpa}">
									<p>${education.education} (${education.specialization}) with ${education.percentage} CGPA in the year ${education.passoutYear}</p>
								</c:if>
								<c:if test="${!education.gpa}">
									<p>${education.education} (${education.specialization}) with ${education.percentage}% in the year ${education.passoutYear}</p>
								</c:if>
							</article>
						</div>
					</c:forEach>
				</div>
				<div class="clear"></div>
			</section>
			</c:if>
			 <c:forEach items="${cvInfo.newSummary}" var="summary">
			 	<section>
			 		<div class="sectionTitle1">
						<h1>${summary.key}</h1>
					</div>
					<div class="sectionContent1">
					<article>
						<p style="margin-left: 13px;">${summary.value}</p>
					</article>
				</div>
			 	</section>
			 </c:forEach>
		</div>
	</div>

</body>
</html>