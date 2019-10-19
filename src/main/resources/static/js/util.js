var skillSet = new Map();
var incrementByOne=0;
var empDetails = new Map();
function addValue(obj) {
	obj.addEventListener("keyup", function(event) {
		if ((event.keyCode === 186 || event.keyCode===13)  && obj.value != '') {
			var enterVal=obj.value;
			if(enterVal.charAt(enterVal.length - 1)===';'){
				enterVal=enterVal.substring(0, enterVal.length - 1);
			}
			var id = enterVal + '_' + incrementByOne;
			incrementByOne=incrementByOne+1;
			skillSet.set(id, enterVal);
			var span = document.createElement("span");
			span.className = "label label-default skill-label";
			span.id = id;
			var node = document.createTextNode(enterVal);
			span.appendChild(node);
			var button = document.createElement("button");
			button.type = "button";
			button.onclick = function() {
				button.parentNode.hidden = true;
				skillSet.delete(button.parentNode.id);
				addTextAreaValues();
			};
			button.className = "close close-button-skill";
			var spanbtn = document.createElement("span");
			var nodespn = document.createTextNode("x");
			spanbtn.appendChild(nodespn);
			button.appendChild(spanbtn);
			span.appendChild(button);
			var div = document.getElementById("skillLabel");
			div.appendChild(span);
			document.getElementById("skillText").value = '';
			addTextAreaValues();
		}
	});
	
	if (event.which === 13) {
	      event.preventDefault();
	}
	
}

function addTextAreaValues(){
	var textAreaSkillsSet=document.getElementById("skillSetTextArea");
	textAreaSkillsSet.value='';
	var get_keys = skillSet.keys(); 
	for(var ele of get_keys) 
	textAreaSkillsSet.value=textAreaSkillsSet.value+'>)]##[(<'+skillSet.get(ele);
}

function removeSkill(button){
	button.parentNode.hidden = true;
	skillSet.delete(button.parentNode.id);
	addTextAreaValues();
}

function showTillWorking(obj){
	if(obj.id==='isCurrentCompanyYes'){
		document.getElementById("working_till_div_section").hidden=true;
	}
	if(obj.id==='isCurrentCompanyNo'){
		document.getElementById("working_till_div_section").hidden=false;
	}
}

function addToEmplyeeSec(){
	var employee = new Map();
	var form_organization=document.getElementById("form_organization");
	var form_designation=document.getElementById("form_designation");
	var isCurrentCompanyNo=document.getElementById("isCurrentCompanyNo");
	var isCurrentCompanyYes=document.getElementById("isCurrentCompanyYes");
	var selectYearWorkingFrom=document.getElementById("selectYearWorkingFrom");
	var selectMonthWorkingFrom=document.getElementById("selectMonthWorkingFrom");
	var selectYearWorkingTill=document.getElementById("selectYearWorkingTill");
	var selectMonthWorkingTill=document.getElementById("selectMonthWorkingTill");
	var organization_description=document.getElementById("organization_description");
	
	var key_id=form_organization.value+"_"+form_designation.value+"_"+selectYearWorkingFrom.value+"_"+selectMonthWorkingFrom.value;
	var div = document.createElement("div");
	div.className = "card-body card-body-div";
	
	var edit_trash = document.createElement("div");
	edit_trash.className = "edit-trash-div";
	
	var edit = document.createElement("i");
	edit.className = "fa fa-edit edit-trash-style";
	edit.setAttribute("data-info", key_id);
	edit.setAttribute("data-toggle", "modal");
	edit.setAttribute("data-target", "#addEmployment");
	/*edit.onclick = function(e) {
		$('#addEmployment').modal('show');
	};*/
	edit_trash.appendChild(edit);
	var trash = document.createElement("i");
	trash.className = "fa fa-trash edit-trash-style";
	trash.onclick = function() {
		deleteEmployee(this.parentNode.parentNode.parentNode.id)
	};
	edit_trash.appendChild(trash);
	
	div.appendChild(edit_trash);
	
	var node = document.createTextNode(form_organization.value);
	div.appendChild(node);
	employee.set("form_organization", form_organization.value);
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_designation.value);
	div.appendChild(node);
	employee.set("form_designation", form_designation.value);
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(selectMonthWorkingFrom.value+'  '+selectYearWorkingFrom.value);
	div.appendChild(node);
	
	employee.set("selectMonthWorkingFrom", selectMonthWorkingFrom.value);
	employee.set("selectYearWorkingFrom", selectYearWorkingFrom.value);
	
	if(isCurrentCompanyNo.checked){
		/* div.appendChild(document.createElement("br")); */
		node = document.createTextNode(" - "+selectMonthWorkingTill.value+'  '+selectYearWorkingTill.value);
		div.appendChild(node);
		
		employee.set("selectMonthWorkingTill", selectMonthWorkingTill.value);
		employee.set("selectYearWorkingTill", selectYearWorkingTill.value);
		employee.set("isCurrentCompany",false);
	}else{
		employee.set("isCurrentCompany",true);
		/* div.appendChild(document.createElement("br")); */
		node = document.createTextNode(" - Present");
		div.appendChild(node);
	}
	
	div.appendChild(document.createElement("br"));
	var s;
	var desc = split(organization_description.value);
	for(s in desc){
		node = document.createTextNode("# "+desc[s]+".");
		div.appendChild(node);
		div.appendChild(document.createElement("br"));
	}

	employee.set("organization_description", organization_description.value);
	addToTextArea(employee);
	empDetails.set(key_id,employee);
	
	var div_up = document.createElement("div");
	div_up.className = "card";
	div_up.id=key_id;
	div_up.appendChild(div);
	document.getElementById("addEmploymentDIV").appendChild(div_up);
	
	// Set empty for all variables
	form_organization.value='';
	form_designation.value='';
	isCurrentCompanyNo.checked=true;
	isCurrentCompanyYes.checked=false;
	selectYearWorkingFrom.value='Select Year';
	selectMonthWorkingFrom.value='Select Month';
	selectYearWorkingTill.value='Select Year';
	selectMonthWorkingTill.value='Select Month';
	organization_description.value='';
	document.getElementById("working_till_div_section").hidden=false;
	
	$('#addEmployment').modal('hide');
}

function deleteEmployee(empid){
	document.getElementById(empid).hidden = true;
	empDetails.delete(empid);
	document.getElementById("employeDetailsTextArea").value='';
	var employeeDetails = empDetails.values(); 
	for(var em of employeeDetails) {
		addToTextArea(em);
	}
}

function split(s) {
	  return s.split(".\n");
}

function addToTextArea(emp){
	var textData='';
	textData=textData+'organization:'+emp.get("form_organization")+'>)]##[(<';
	textData=textData+'designation:'+emp.get("form_designation")+'>)]##[(<';
	textData=textData+'MonthWorkingFrom:'+emp.get("selectMonthWorkingFrom")+'>)]##[(<';
	textData=textData+'YearWorkingFrom:'+emp.get("selectYearWorkingFrom")+'>)]##[(<';
	if(emp.get("isCurrentCompany")){
		textData=textData+'MonthWorkingTill:'+emp.get("selectMonthWorkingTill")+'>)]##[(<';
		textData=textData+'YearWorkingTill:'+emp.get("selectYearWorkingTill")+'>)]##[(<';
	}
	textData=textData+'Description:'+emp.get("organization_description");
	
	var textAreaEmployee=document.getElementById("employeDetailsTextArea").value;
	textAreaEmployee=textAreaEmployee+'>)]##[(<>)]##[(<>)]##[(<>)]##[(<'+textData;
	document.getElementById("employeDetailsTextArea").value=textAreaEmployee;
}

function addToEducationSec(){
	var textData='';
	var form_education=document.getElementById("form_education");
	var form_specialization=document.getElementById("form_specialization");
	var form_university=document.getElementById("form_university");
	var form_PassingOutYear=document.getElementById("form_PassingOutYear");
	var form_GradePercentage=document.getElementById("form_GradePercentage");
	
	var div = document.createElement("div");
	div.className = "card-body";
	
	var node = document.createTextNode(form_education.value+' - '+form_specialization.value);
	div.appendChild(node);
	textData=textData+'Education:'+form_education.value+'>)]##[(<';
	textData=textData+'Specililization:'+form_specialization.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_university.value);
	div.appendChild(node);
	textData=textData+'University:'+form_university.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_PassingOutYear.value+' with Grade/Percentage '+form_GradePercentage.value);
	div.appendChild(node);
	textData=textData+'Passing Out:'+form_PassingOutYear.value+'>)]##[(<';
	textData=textData+'Grade/Percentage:'+form_GradePercentage.value;
	
	var div_up = document.createElement("div");
	div_up.className = "card";
	div_up.appendChild(div);
	document.getElementById("addEducationDIV").appendChild(div_up);
	
	var textAreaEmployee=document.getElementById("educationDetailsTextArea").value;
	textAreaEmployee=textAreaEmployee+'>)]##[(<>)]##[(<>)]##[(<>)]##[(<'+textData;
	document.getElementById("educationDetailsTextArea").value=textAreaEmployee;
	
	
	// Set empty for all variables
	form_education.value='';
	form_specialization.value='';
	form_university.value='';
	form_PassingOutYear.value='';
	form_GradePercentage.value='';
	
	$('#addEducation').modal('hide');
}

function addToProjectSec(){
	var textData='';
	var form_ProjectName=document.getElementById("form_ProjectName");
	var form_ClientName=document.getElementById("form_ClientName");
	var form_SkillsUsed=document.getElementById("form_SkillsUsed");
	var form_FromProjectDate=document.getElementById("form_FromProjectDate");
	var form_ToProjectDate=document.getElementById("form_ToProjectDate");
	var form_ProjectDescription=document.getElementById("form_ProjectDescription");
	var form_RolesResponsibilities=document.getElementById("form_RolesResponsibilities");
	
	var div = document.createElement("div");
	div.className = "card-body";
	
	var node = document.createTextNode(form_ProjectName.value);
	div.appendChild(node);
	textData=textData+'Project:'+form_ProjectName.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_ClientName.value);
	div.appendChild(node);
	textData=textData+'Client:'+form_ClientName.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_SkillsUsed.value);
	div.appendChild(node);
	textData=textData+'Skills:'+form_SkillsUsed.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_FromProjectDate.value+' - '+form_ToProjectDate.value);
	div.appendChild(node);
	textData=textData+'FromProjectDate:'+form_FromProjectDate.value+'>)]##[(<';
	textData=textData+'ToProjectDate:'+form_ToProjectDate.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_ProjectDescription.value);
	div.appendChild(node);
	textData=textData+'Description:'+form_ProjectDescription.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_RolesResponsibilities.value);
	div.appendChild(node);
	textData=textData+'Roles and Responsiblilities:'+form_RolesResponsibilities.value;
	
	var div_up = document.createElement("div");
	div_up.className = "card";
	div_up.appendChild(div);
	document.getElementById("addProjectDIV").appendChild(div_up);
	
	var textAreaEmployee=document.getElementById("projectDetailsTextArea").value;
	textAreaEmployee=textAreaEmployee+'>)]##[(<>)]##[(<>)]##[(<>)]##[(<'+textData;
	document.getElementById("projectDetailsTextArea").value=textAreaEmployee;
	
	// Set empty for all variables
	form_ProjectName.value='';
	form_ClientName.value='';
	form_SkillsUsed.value='';
	form_FromProjectDate.value='';
	form_ToProjectDate.value='';
	form_ProjectDescription.value='';
	form_RolesResponsibilities.value='';
	
	$('#addProject').modal('hide');
}

function addNewSection() {
	if(document.getElementById("list_ItemNewSummary1").hidden){
		document.getElementById("list_ItemNewSummary1").hidden=false;
	}
	else if(document.getElementById("list_ItemNewSummary2").hidden){
		document.getElementById("list_ItemNewSummary2").hidden=false;
	}
	else if(document.getElementById("list_ItemNewSummary3").hidden){
		document.getElementById("list_ItemNewSummary3").hidden=false;
	}
	else if(document.getElementById("list_ItemNewSummary4").hidden){
		document.getElementById("list_ItemNewSummary4").hidden=false;
	}
	var val=document.getElementById('form_NewSection').value;
	if(!val){
		val="New Section";
	}
	var node = document.createTextNode(val);
	if(!document.getElementById('newSummaryButton1').childNodes[0].wholeText.trim()){
		document.getElementById('newSummaryButton1').appendChild(node);
		document.getElementById('newSummaryInput1').value=val;
	}
	else if(!document.getElementById('newSummaryButton2').childNodes[0].wholeText.trim()){
		document.getElementById('newSummaryButton2').appendChild(node);
		document.getElementById('newSummaryInput2').value=val;
	}
	else if(!document.getElementById('newSummaryButton3').childNodes[0].wholeText.trim()){
		document.getElementById('newSummaryButton3').appendChild(node);
		document.getElementById('newSummaryInput3').value=val;
	}
	else if(!document.getElementById('newSummaryButton4').childNodes[0].wholeText.trim()){
		document.getElementById('newSummaryButton4').appendChild(node);
		document.getElementById('newSummaryInput4').value=val;
	}
	$('#addNewSection').modal('hide');
}

$(document).ready( function() {
	$(document).on('change', '.btn-file :file', function() {
	var input = $(this),
		label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	input.trigger('fileselect', [label]);
	});

	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        
	        reader.onload = function (e) {
	            $('#img-upload').attr('src', e.target.result);
	        }
	        
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgProfile").change(function(){
	    readURL(this);
	}); 	
});

$(window).on('load',function(){
    $('#publishProfile').modal('show');
});

$("#collapseTwo").on('show.bs.collapse', function(e){
	let $collapsedTarget = $(e.target),
	skills = $collapsedTarget.attr('data');
	skills = skills.slice(1,-1);
	skills = skills.split(", ");
	index = 0;
	while (index < skills.length) { 
	    skillSet.set(skills[index]+'_'+index, skills[index]);
	    index++; 
	}
	incrementByOne=index;
});

$("#collapseThree").on('show.bs.collapse', function(e){
	let $collapsedTarget = $(e.target);
	if($collapsedTarget.attr('data')){
	emp = JSON.parse($collapsedTarget.attr('data'));
	for (i = 0; i < emp.length; i++) {
		var e = emp[i];
		var employee = new Map();
		employee.set("form_organization", e.organisation);
		employee.set("form_designation", e.designation);
		employee.set("selectMonthWorkingFrom", e.monthWorkingFrom);
		employee.set("selectYearWorkingFrom", e.yearWorkingFrom);
		var key_id=e.organisation+"_"+e.designation+"_"+e.yearWorkingFrom+"_"+e.monthWorkingFrom;
		if(!e.currentCompany){
			employee.set("selectMonthWorkingTill", e.monthWorkingTill);
			employee.set("selectYearWorkingTill", e.yearWorkingTill);
		}
		var desc = e.descriptions;
		var d='';
		for (j = 0; j < desc.length; j++) {
			d = d+desc[j];
		}
		employee.set("organization_description", d);
		addToTextArea(employee);
		empDetails.set(key_id,employee);
	 }
	}
	
});

$("#addEmployment").on('show.bs.modal', function(e){
	var emp_id=e.relatedTarget.dataset.info;
	var emp=empDetails.get(emp_id);
	showEmployeeModal(emp,emp_id);
});

function showEmployeeModal(emp,emp_id){
	if(emp){
		document.getElementById('form_organization').value=emp.get("form_organization");
		document.getElementById('form_designation').value=emp.get("form_designation");
		document.getElementById('selectYearWorkingFrom').value=emp.get("selectYearWorkingFrom");
		document.getElementById('selectMonthWorkingFrom').value=emp.get("selectMonthWorkingFrom");
		if(!emp.get("selectYearWorkingTill") && !emp.get("selectMonthWorkingTill")){
			document.getElementById('working_till_div_section').hidden=true;
			document.getElementById('isCurrentCompanyNo').checked=false;
			document.getElementById('isCurrentCompanyYes').checked=true;
		}else{
			document.getElementById('selectYearWorkingTill').value=emp.get("selectYearWorkingTill");
			document.getElementById('selectMonthWorkingTill').value=emp.get("selectMonthWorkingTill");
			document.getElementById('isCurrentCompanyNo').checked=true;
			document.getElementById('isCurrentCompanyYes').checked=false;
			document.getElementById('working_till_div_section').hidden=false;
		}
		document.getElementById('organization_description').value=emp.get("organization_description");
		
		document.getElementById('add_employee').hidden=true;
		if(!document.getElementById('update_employee')){
		var button = document.createElement("button");
		button.type = "button";
		button.id = "update_employee";
		button.className = "btn btn-primary add-button-emp";
		button.setAttribute("data-empid", emp_id);
		var node = document.createTextNode("Update");
		button.appendChild(node);
		button.onclick = function(e) {
			var empid=e.currentTarget.dataset.empid;
			empDetails.delete(empid);
			document.getElementById(empid).hidden=true;
			addToEmplyeeSec();
			/*Need to test*/
			document.getElementById("employeDetailsTextArea").value='';
			var employeeDetails = empDetails.values(); 
			for(var em of employeeDetails) {
				addToTextArea(em);
			}
			document.getElementById('add_employee').hidden=false;
			document.getElementById('update_employee').hidden=true;
		};
		document.getElementById('emp_div_section').appendChild(button);
		}
		}
}

function showDataSave(){
	document.getElementById('li_nav_item_save').hidden = false;
}

function ExportPdf(name) {
	document.getElementById('cv123').hidden = false;
	kendo.drawing.drawDOM("#cv123", {
		forcePageBreak: ".page-break", // add this class to each element where
										// you want manual page break
		paperSize : "A4",
		margin : {
			top : "1cm",
			bottom : "1cm",
			left:"1cm",
			right:"1cm"
		},
		scale : 0.6,
		height : 500,
		template: $("#page-template").html(),
        keepTogether: ".prevent-split"
	}).then(function(group) {
		document.getElementById('cv123').hidden = true;
		kendo.drawing.pdf.saveAs(group, "Resume_"+name+".pdf");
	});
}


function validateForm() {
	  var name = document.forms["form_submit_resume_details"]["fullName"].value;
	  if (name == "") {
	    alert("Full Name can't be empty.");
	    return false;
	  }
	  
	  var email = document.forms["form_submit_resume_details"]["email"].value;
	  if (email == "") {
	    alert("Email Name can't be empty.");
	    return false;
	  }
	  
	  var phone = document.forms["form_submit_resume_details"]["phone"].value;
	  if (phone == "") {
	    alert("Please provide atleast one phone number.");
	    return false;
	  }
	  
	}