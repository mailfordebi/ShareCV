<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>	
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>ShareCV - Create, Build, Publish Online</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700|Open+Sans:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

</head>

<body>

  <header id="header">
    <div class="container">

      <div id="logo" class="pull-left">
        <h1><a href="${pageContext.request.contextPath}/index" class="scrollto">SHARECV</a></h1>
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
          <li class="menu-active"><a href="#intro">Resume</a></li>
          <li><a href="${pageContext.request.contextPath}/biodata">Biodata</a></li>
          <li><a href="${pageContext.request.contextPath}/cv">CV</a></li>
          <li><a href="${pageContext.request.contextPath}/coverletter">Cover Letter</a></li>
          <li><a href="#">Upgrade to PRO</a></li>
          <li class="menu-has-children"><a href="#">Language</a>
            <ul>
              <li><a href="#">English</a></li>
              <li><a href="#">Dutch</a></li>
            </ul>
          </li>
          <c:if test="${!sessionScope.isLoggedIn}">
          	 <li><a href="${pageContext.request.contextPath}/login?page=resume_builder">Login/Signup</a></li>
           </c:if>
           <c:if test="${sessionScope.isLoggedIn}">
           	<li class="menu-has-children"><a href="#">Hello, ${username}</a>
            <ul>
              <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
              <li><a href="${pageContext.request.contextPath}/${sessionScope.user.email}">Profile</a></li>
            </ul>
          </li>
           </c:if>
        </ul>
      </nav>
    </div>
  </header>

 <form action="${pageContext.request.contextPath}/resume_action_submit" id="form_submit_resume_details" name="form_submit_resume_details" method="post" enctype="multipart/form-data"> 
  <section id="intro" class="intro-section">
  <div id="accordion" class="resume-builder-section">
  <section class="container12" id="lisContainer12">
  
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">1</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingOne">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link card-button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          + Personal Information
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
        <div class="form-group basic-info">
    		<label for="fullName">Full Name</label>
   			 <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter Name">
  		</div>
  		<div class="form-group basic-info">
    		<label for="email">Email</label>
    		<input type="email" class="form-control" id="email" name="email" placeholder="Email">
  		</div>
  		<div class="form-group basic-info">
    		<label for="phone">Phone Numbers</label>
    		<input type="text" class="form-control" id="phone" name="phone">
    		<small id="phoneHelp" class="form-text text-muted">If you have more than one number, separate with commas.</small>
  		</div>
  		<div class="form-group basic-info">
    		<label for="websites">Websites</label>
    		<input type="text" class="form-control" id="websites" name="websites">
    		<small id="websitesHelp" class="form-text text-muted">If you have more than one URL, separate with commas.</small>
  		</div>
  		<div class="form-group basic-info">
    		<label for="address1">Address Line 1</label>
   			 <input type="text" class="form-control" id="address1" name="address1">
  		</div>
  		<div class="form-group basic-info">
    		<label for="address2">Address Line 2</label>
    		<input type="text" class="form-control" id="address2" name="address2">
  		</div>
  		<div class="form-group basic-info">
    		<label for="facebook">Facebook Profile</label>
    		<input type="text" class="form-control" id="facebook" name="facebook">
  		</div>
  		<div class="form-group basic-info">
    		<label for="twitter">Twitter Profile</label>
    		<input type="text" class="form-control" id="twitter" name="twitter">
  		</div>
  		<div class="form-group basic-info">
    		<label for="github">Github Profile</label>
    		<input type="text" class="form-control" id="github" name="github">
  		</div>
  		<div class="form-group basic-info">
    		<label for="stackoverflow">Stack OverFlow Profile</label>
    		<input type="text" class="form-control" id="stackoverflow" name="stackoverflow">
  		</div>
  		<div class="form-group basic-info">
    		<label for="linkedin">LinkedIn Profile</label>
    		<input type="text" class="form-control" id="linkedin" name="linkedin">
  		</div>
  		<div class="form-group image-upload basic-info">
        	<div class="input-group">
           	 <span class="input-group-btn">
                <span class="btn btn-default1 btn-file">
                    Upload Photo
                    <input type="file" id="imgProfile" name="imgProfile">
                </span>
            </span>
       		</div>
       		<div>
       			<img id='img-upload'/>
       		</div>
    	</div>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">2</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingTwo">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          + Skills & Expertise
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
      		<input type="text" class="form-control skillset-info" id="skillText" onkeypress="addValue(this);">
   			<small id="websitesHelp" class="form-text text-muted">Press "Enter" Key to add your skill</small>
   			<div class="skill-lebel-div" id="skillLabel">
  			</div>
  			<!-- Need to send this to server for skills details and filter this -->
  			<textarea class="form-control skillset-info" id="skillSetTextArea" name="skillSetTextArea" rows="3" hidden="true"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">3</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingThree">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          + Employment
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
        <button type="button" class="btn btn-info btn-lg btn-info-emp" data-toggle="modal" data-target="#addEmployment">Add Employment</button>
        <div id="addEmploymentDIV" class="add-employment-div-sec">
        	
        </div>
        
        <!-- Need to send this to server for emplyement details and filter this -->
        <textarea class="form-control" id="employeDetailsTextArea" name="employeDetailsTextArea" hidden="true"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">4</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingFour">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
         + Education
        </button>
      </h5>
    </div>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
      <div class="card-body">
        <button type="button" class="btn btn-info btn-lg btn-info-emp" data-toggle="modal" data-target="#addEducation">Add Education</button>
        <div id="addEducationDIV" class="add-employment-div-sec">
        	
        </div>
        
        <!-- Need to send this to server for education details and filter this -->
        <textarea class="form-control" id="educationDetailsTextArea" name="educationDetailsTextArea" hidden="true"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">5</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingFive">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
         + Projects
        </button>
      </h5>
    </div>
    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordion">
      <div class="card-body">
        <button type="button" class="btn btn-info btn-lg btn-info-emp" data-toggle="modal" data-target="#addProject">Add Project</button>
        <div id="addProjectDIV" class="add-employment-div-sec">
        	
        </div>
        
        <!-- Need to send this to server for project details and filter this -->
        <textarea class="form-control" id="projectDetailsTextArea" name="projectDetailsTextArea" hidden="true"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12">
  <div class="item-content12">
  <span class="order" hidden="true">6</span>
  <div class="card card-drag">
    <div class="card-header resume-header" id="headingSix">
      <h5 class="mb-0">
        <button type="button" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
         + Profile Summary
        </button>
      </h5>
    </div>
    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
      <div class="card-body">
        <!-- Need to send this to server for profile summary details and filter this -->
        <textarea class="form-control" id="profileSummaryTextArea" name="profileSummaryTextArea" rows="7" placeholder="Add Your Profile Summary"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  
  <!-- Due to below codes drag drop not working properly. Need to inject the below codes from java script.. -->
  <div class="list-item12" id="list_ItemNewSummary1" hidden="true">
  <div class="item-content12">
  <span class="order" hidden="true">7</span>
  <div class="card card-drag">
     <div class="card-header resume-header" id="headingSeven">
      <h5 class="mb-0">
        <button type="button" id="newSummaryButton1" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
         
        </button>
        <input type="text" name="newSummaryInput1" id="newSummaryInput1" value="" hidden="true">
      </h5>
    </div> 
    <div id="collapseSeven" class="collapse" aria-labelledby="headingSeven" data-parent="#accordion">
      <div class="card-body">
        <!-- Need to send this to server for profile summary details and filter this -->
        <textarea class="form-control" id="newSummaryTextArea1" name="newSummaryTextArea1" rows="7" placeholder="Add Text Here"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12" id="list_ItemNewSummary2" hidden="true">
  <div class="item-content12">
  <span class="order" hidden="true">8</span>
  <div class="card card-drag">
     <div class="card-header resume-header" id="headingEight">
      <h5 class="mb-0">
        <button type="button" id="newSummaryButton2" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
         
        </button>
        <input type="text" name="newSummaryInput2" id="newSummaryInput2" value="" hidden="true">
      </h5>
    </div> 
    <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordion">
      <div class="card-body">
        <!-- Need to send this to server for profile summary details and filter this -->
        <textarea class="form-control" id="newSummaryTextArea2" name="newSummaryTextArea2" rows="7" placeholder="Add Text Here"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12" id="list_ItemNewSummary3" hidden="true">
  <div class="item-content12">
  <span class="order" hidden="true">9</span>
  <div class="card card-drag">
     <div class="card-header resume-header" id="headingNine">
      <h5 class="mb-0">
        <button type="button" id="newSummaryButton3" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
         
        </button>
        <input type="text" name="newSummaryInput3" id="newSummaryInput3" value="" hidden="true">
      </h5>
    </div> 
    <div id="collapseNine" class="collapse" aria-labelledby="headingNine" data-parent="#accordion">
      <div class="card-body">
        <!-- Need to send this to server for profile summary details and filter this -->
        <textarea class="form-control" id="newSummaryTextArea3" name="newSummaryTextArea3" rows="7" placeholder="Add Text Here"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  <div class="list-item12" id="list_ItemNewSummary4" hidden="true">
  <div class="item-content12">
  <span class="order" hidden="true">10</span>
  <div class="card card-drag">
     <div class="card-header resume-header" id="headingTen">
      <h5 class="mb-0">
        <button type="button" id="newSummaryButton4" class="btn btn-link collapsed card-button" data-toggle="collapse" data-target="#collapseTen" aria-expanded="false" aria-controls="collapseTen">
        
        </button>
        <input type="text" name="newSummaryInput4" id="newSummaryInput4" value="" hidden="true">
      </h5>
    </div> 
    <div id="collapseTen" class="collapse" aria-labelledby="headingTen" data-parent="#accordion">
      <div class="card-body">
        <!-- Need to send this to server for profile summary details and filter this -->
        <textarea class="form-control" id="newSummaryTextArea4" name="newSummaryTextArea4" rows="7" placeholder="Add Text Here"></textarea>
      </div>
    </div>
  </div>
  </div>
  </div>
  
  </section>
  
  <!-- Need to move to header -->
  <!-- <div class="list-item12">-->
  <div class="btn-form-submit"> 
  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addNewSection">+ Add new section</button>
  <button type="submit" class="btn btn-default">Save</button>
   </div>
  <!--</div> --> 
  <!-- Need to move to header -->
   
</div>
   
  </section>
  </form>
  
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 text-lg-left text-center">
          <div class="copyright">
            &copy; Copyright <strong>ShareCV</strong>. All Rights Reserved
          </div>
        </div>
      </div>
    </div>
  </footer>
  
<div class="modal fade" id="addEmployment" role="dialog">
    <div class="modal-dialog emp-dialog-box">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal_content">
        <div class="modal-body">
          <div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div>
             <div class="emp-form-div">
         	 	<span class="widgetTitle">Add Employment</span>
         	 </div>
         	 <div class="form-group emp-form-div">
    			<label for="organization">Your Organization:</label>
   			 	<input type="text" class="form-control" id="form_organization" placeholder="Type Your Organization">
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="designation">Your Designation:</label>
   			 	<input type="text" class="form-control" id="form_designation" placeholder="Type Your Designation">
  			</div>
  			<div class="emp-form-div">
  				<label for="organization">Is this your current company?</label>
  				<div class="radio">
      				<label><input type="radio" name="isCurrentCompany" id="isCurrentCompanyNo" checked onclick="showTillWorking(this)">No</label>
      				<label><input type="radio" name="isCurrentCompany" id="isCurrentCompanyYes" onclick="showTillWorking(this)">Yes</label>
    			</div>
    		</div>
    		<div class="form-group emp-form-div-year">
    			 <div>
 				 <label for="workingFrom">Started Working From:</label>
 				 </div>
 				 <div>
 				 <div>
  				 <select class="form-control select-form-control" id="selectYearWorkingFrom">
   				 	 <option>Select Year</option>
    			 	 <option>2019</option>
   					 <option>2018</option>
    				 <option>2017</option>
    				 <option>2016</option>
    				 <option>2015</option>
    				 <option>2014</option>
    				 <option>2013</option>
  				</select>
  				</div>
  				<div>
  				 <select class="form-control select-form-control" id="selectMonthWorkingFrom">
   				 	 <option>Select Month</option>
    			 	 <option>Jan</option>
   					 <option>Feb</option>
    				 <option>Mar</option>
    				 <option>Apr</option>
    				 <option>May</option>
    				 <option>Jun</option>
    				 <option>Jul</option>
    				 <option>Aug</option>
    				 <option>Sep</option>
    				 <option>Oct</option>
    				 <option>Nov</option>
    				 <option>Dec</option>
  				</select>
  				</div>
  				</div>
			</div>
			
			<div class="form-group emp-till-div-year" id="working_till_div_section">
    			 <div>
 				 <label for="workingTill">Working Till:</label>
 				 </div>
 				 <div>
 				 <div>
  				 <select class="form-control select-form-control" id="selectYearWorkingTill">
   				 	 <option>Select Year</option>
    			 	 <option>2019</option>
   					 <option>2018</option>
    				 <option>2017</option>
    				 <option>2016</option>
    				 <option>2015</option>
    				 <option>2014</option>
    				 <option>2013</option>
  				</select>
  				</div>
  				<div>
  				 <select class="form-control select-form-control" id="selectMonthWorkingTill">
   				 	 <option>Select Month</option>
    			 	 <option>Jan</option>
   					 <option>Feb</option>
    				 <option>Mar</option>
    				 <option>Apr</option>
    				 <option>May</option>
    				 <option>Jun</option>
    				 <option>Jul</option>
    				 <option>Aug</option>
    				 <option>Sep</option>
    				 <option>Oct</option>
    				 <option>Nov</option>
    				 <option>Dec</option>
  				</select>
  				</div>
  				</div>
			</div>
          
			<div class="form-group emp-form-div emp-description">
    			<label for="empDescription">Describe your Job Profile, Roles & Responsibilities:</label>
   			 	<textarea class="form-control" rows="5" id="organization_description" placeholder="Type here..."></textarea>
  			</div>          
          </div>
          <div class="emp-div-button">
          <button type="button" class="btn btn-link btn-cancel-emp" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-primary add-button-emp" onclick="addToEmplyeeSec()">Add</button>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  

 <div class="modal fade" id="addEducation" role="dialog">
    <div class="modal-dialog emp-dialog-box">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal_content">
        <div class="modal-body">
          <div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div>
             <div class="emp-form-div">
         	 	<span class="widgetTitle">Add Education</span>
         	 </div>
         	 <div class="form-group emp-form-div">
    			<label for="form_education">Education:</label>
   			 	<input type="text" class="form-control" id="form_education" placeholder="Type Your Education">
   			 	<small id="form_GradePercentageHelp" class="form-text text-muted">e.g. B.Tech</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_specialization">Specialization:</label>
   			 	<input type="text" class="form-control" id="form_specialization" placeholder="Type Your Specialization">
   			 	<small id="form_GradePercentageHelp" class="form-text text-muted">e.g. Computer Science</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_university">University/Institute:</label>
   			 	<input type="text" class="form-control" id="form_university" placeholder="Type Your University or Institute">
   			 	<small id="form_GradePercentageHelp" class="form-text text-muted">e.g. Utkal University</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_PassingOutYear">Passing Out Year:</label>
   			 	<input type="text" class="form-control" id="form_PassingOutYear" placeholder="">
   			 	<small id="form_GradePercentageHelp" class="form-text text-muted">e.g. 2014</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_GradePercentage">Grade/Percentage:</label>
   			 	<input type="text" class="form-control" id="form_GradePercentage" placeholder="">
   			 	<small id="form_GradePercentageHelp" class="form-text text-muted">e.g. 9.2 or 92%</small>
  			</div>
          
          </div>
          <div class="emp-div-button">
          <button type="button" class="btn btn-link btn-cancel-emp" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-primary add-button-emp" onclick="addToEducationSec()">Add</button>
          </div>
        </div>
      </div>
      
    </div>
  </div>


<div class="modal fade" id="addProject" role="dialog">
    <div class="modal-dialog emp-dialog-box">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal_content">
        <div class="modal-body">
          <div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div>
             <div class="emp-form-div">
         	 	<span class="widgetTitle">Add Project</span>
         	 </div>
         	 <div class="form-group emp-form-div">
    			<label for="form_ProjectName">Project Name:</label>
   			 	<input type="text" class="form-control" id="form_ProjectName" placeholder="Type Your Project Name">
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_ClientName">Client Name:</label>
   			 	<input type="text" class="form-control" id="form_ClientName" placeholder="Type Your Client Name">
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_SkillsUsed">Skills Used:</label>
   			 	<input type="text" class="form-control" id="form_SkillsUsed" placeholder="Type Your Used in Project">
   			 	<small id="form_SkillsUsedHelp" class="form-text text-muted">Enter skills like Java,Oracle,Eclipse</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_FromProjectDate">From:</label>
   			 	<input type="text" class="form-control" id="form_FromProjectDate" placeholder="Enter From date(MMM YYYY)">
   			 	<small id="form_FromProjectDateHelp" class="form-text text-muted">e.g. Jan 2014</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_ToProjectDate">To:</label>
   			 	<input type="text" class="form-control" id="form_ToProjectDate" placeholder="Enter To date(MMM YYYY)">
   			 	<small id="form_ToProjectDateHelp" class="form-text text-muted">e.g. Jan 2017</small>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_ProjectDescription">Project Description:</label>
   			 	<textarea class="form-control" rows="5" id="form_ProjectDescription" placeholder="Type Project Description"></textarea>
  			</div>
  			<div class="form-group emp-form-div">
    			<label for="form_RolesResponsibilities">Roles & Responsibilities:</label>
   			 	<textarea class="form-control" rows="5" id="form_RolesResponsibilities" placeholder="Type Roles & Responsibilities"></textarea>
  			</div>
          
          </div>
          <div class="emp-div-button">
          <button type="button" class="btn btn-link btn-cancel-emp" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-primary add-button-emp" onclick="addToProjectSec()">Add</button>
          </div>
        </div>
      </div>
      
    </div>
  </div>

<div class="modal fade" id="addNewSection" role="dialog">
    <div class="modal-dialog emp-dialog-box">
    
      <!-- Modal content-->
      <div class="modal-content" id="modal_content">
        <div class="modal-body">
          <div>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div>
             <div class="emp-form-div">
         	 	<span class="widgetTitle">Add New Section</span>
         	 </div>
         	 <div class="form-group emp-form-div">
   			 	<input type="text" class="form-control" id="form_NewSection" placeholder="Type Your Section Name">
  			</div>
          </div>
          <div class="emp-div-button">
          <button type="button" class="btn btn-link btn-cancel-emp" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-primary add-button-emp" onclick="addNewSection()">Add</button>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  
  
  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/wow/wow.min.js"></script>
  <script src="lib/superfish/hoverIntent.js"></script>
  <script src="lib/superfish/superfish.min.js"></script>
  <script src="lib/magnific-popup/magnific-popup.min.js"></script>

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
  <script type="text/javascript" src="js/Draggable.min.js"></script>
<script type="text/javascript" src="js/TweenMax.min.js"></script>
<script type="text/javascript" src="js/DragDrop.js"></script>
<script type="text/javascript" src="js/util.js"></script>

</body>
</html>
