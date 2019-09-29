<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Resume - ${cvInfo.fullName}</title>
  
  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/resume.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none">${cvInfo.fullName}</span>
      <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="data:image/jpeg;base64,${cvInfo.profileImage}" alt="Red dot">
      </span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
      	<c:if test="${sessionScope.isLoggedIn}">
     		<li class="nav-item">
         	 <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/index">My Home</a>
       		 </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#about">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#experience">Experience</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#skills">Skills</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#projects">Projects</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#education">Education</a>
        </li>
        <c:forEach items="${cvInfo.newSummary}" var="summary">
        	<li class="nav-item">
          		<a class="nav-link js-scroll-trigger" href="#${summary.key}">${summary.key}</a>
       		</li>
		</c:forEach>
		<li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath}/downloadPublishedCV">Download</a>
        </li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid p-0">
    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
      <div class="w-100">
        <h1 class="mb-0">${cvInfo.fullName}
        </h1>
        <div class="subheading mb-5">
        	<c:if test="${not empty cvInfo.address1}">
        	${cvInfo.address1},
        	</c:if>
        	<c:if test="${not empty cvInfo.address2}">
        	${cvInfo.address2},
        	</c:if>
        	<br>
        	<c:if test="${not empty cvInfo.phoneNos}">
        	Phone: 
        	<c:forEach var="phone" items="${cvInfo.phoneNos}">
               <c:if test="${not empty phone}">
               ${phone} 
                </c:if>
            </c:forEach>
            </c:if>
            <br>
            <c:if test="${not empty cvInfo.websites}">
            Websites: 
            <c:forEach var="website" items="${cvInfo.websites}">
               <c:if test="${not empty website}">
               <a href="${website}" target="_blank" class="anchor_decoration">${website} </a>
               </c:if>
            </c:forEach>
            </c:if>
            <br>
          	<c:if test="${not empty cvInfo.email}">  
         		Email: <a href="mailto:${cvInfo.email}" class="anchor_decoration">${cvInfo.email}</a>
         	</c:if>
        </div>
        <p class="lead mb-5 text-decoration">
        	<c:forEach var="summary" items="${cvInfo.profileSummaries}">
               ${summary}.<br>
            </c:forEach>
        </p>
        <div class="social-icons">
        <c:if test="${not empty cvInfo.linkedin}">
          <a href="https://${cvInfo.linkedin}" target="_blank">
            <i class="fab fa-linkedin-in"></i>
          </a>
          </c:if>
          <c:if test="${not empty cvInfo.github}">
          <a href="https://${cvInfo.github}" target="_blank">
            <i class="fab fa-github"></i>
          </a>
          </c:if>
          <c:if test="${not empty cvInfo.twitter}">
          <a href="https://${cvInfo.twitter}" target="_blank">
            <i class="fab fa-twitter"></i>
          </a>
          </c:if>
          <c:if test="${not empty cvInfo.facebook}">
          <a href="https://${cvInfo.facebook}" target="_blank">
            <i class="fab fa-facebook-f"></i>
          </a>
          </c:if>
          <c:if test="${not empty cvInfo.stackoverflow}">
          <a href="https://${cvInfo.stackoverflow}" target="_blank">
            <i class="fab fa-stack-overflow"></i>
          </a>
          </c:if>
        </div>
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="experience">
      <div class="w-100">
        <h2 class="mb-5">Experience</h2>
		 <c:forEach var="employement" items="${cvInfo.employements}">
              	 <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
         			 <div class="resume-content">
           				 <h3 class="mb-0">${employement.designation}</h3>
           				 <div class="subheading mb-3">${employement.organisation}</div>
           				 <p class="text-decoration">
           				 	 <c:forEach var="desc" items="${employement.descriptions}">
           				 	 	${desc}.<br>
           				 	 </c:forEach>
           				 </p>
        			 </div>
          			<div class="resume-date text-md-right">
          				 <c:if test="${employement.currentCompany}">
           				 <span class="text-primary">${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - Present</span>
           				 </c:if>
           				  <c:if test="${!employement.currentCompany}">
           				 <span class="text-primary">${employement.monthWorkingFrom} ${employement.yearWorkingFrom} - ${employement.monthWorkingTill} ${employement.yearWorkingTill}</span>
           				 </c:if>
          			</div>
        		 </div>
         </c:forEach>      
      </div>

    </section>

    <hr class="m-0">
    
    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="skills">
      <div class="w-100">
        <h2>Skills</h2>
        <div class="subheading mb-3">Programming Languages &amp; Tools</div>
        <div>
        	<c:forEach var="skill" items="${cvInfo.skills}">
        		<span class="skill-chip" title="${skill}">${skill}</span>
            </c:forEach>
        </div>
      </div>
    </section>

    <hr class="m-0">
    
    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="projects">
      <div class="w-100">
        <h2 class="mb-5">Projects</h2>
		<c:forEach var="project" items="${cvInfo.projects}">
         <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0">${project.projectName}</h3>
            <div class="subheading mb-3">${project.clientName}
            <br>
            <div class="env-details">
            	Environment: ${project.usedSkills}
            </div>
            </div>
            <h5 class="h5-md-12">Description</h5>
            <p class="text-decoration">${project.projectDescription}</p>
            <h5 class="h5-md-12">Roles & Responsibilities</h5>
            <p class="text-decoration">
              <c:forEach var="respnb" items="${project.responsibilities}">
              	${respnb}.<br>
              </c:forEach>
			</p>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">${project.fromDate} - ${project.toDate}</span>
          </div>
        </div>
        </c:forEach>
      </div>
    </section>

    <hr class="m-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Education</h2>
		<c:forEach var="education" items="${cvInfo.educations}">
        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0">${education.institute}</h3>
            <div class="subheading mb-3">${education.education}</div>
            <div>${education.specialization}</div>
            <c:if test="${education.gpa}">
            	<p>GPA: ${education.percentage}</p>
            </c:if>
            <c:if test="${!education.gpa}">
            	<p>Percentage: ${education.percentage}</p>
            </c:if>
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">Passing Out Year - ${education.passoutYear}</span>
          </div>
        </div>
		</c:forEach>
      </div>
    </section>

    <hr class="m-0">

	 <c:forEach items="${cvInfo.newSummary}" var="summary">
	    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="${summary.key}">
     	 	<div class="w-100">
       			 <h2 class="mb-5">${summary.key}</h2>
       			 <p>${summary.value}</p>
     		</div>
    	</section>

   		<hr class="m-0">
	</c:forEach>

  </div>
  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/resume.min.js"></script>
  <script src="js/util.js"></script>

</body>
</html>
