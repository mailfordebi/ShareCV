var skillSet = new Map();
function addValue(obj) {
	obj.addEventListener("keyup", function(event) {
		if ((event.keyCode === 186 || event.keyCode===13)  && obj.value != '') {
			var enterVal=obj.value;
			if(enterVal.charAt(enterVal.length - 1)===';'){
				enterVal=enterVal.substring(0, enterVal.length - 1);
			}
			var id = enterVal + new Date().valueOf();
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
	
	function addTextAreaValues(){
		var textAreaSkillsSet=document.getElementById("skillSetTextArea");
		textAreaSkillsSet.value='';
		var get_keys = skillSet.keys(); 
		for(var ele of get_keys) 
		textAreaSkillsSet.value=textAreaSkillsSet.value+'>)]##[(<'+skillSet.get(ele);
	}
	
	if (event.which === 13) {
	      event.preventDefault();
	}
	
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
	var textData='';
	var form_organization=document.getElementById("form_organization");
	var form_designation=document.getElementById("form_designation");
	var isCurrentCompanyNo=document.getElementById("isCurrentCompanyNo");
	var isCurrentCompanyYes=document.getElementById("isCurrentCompanyYes");
	var selectYearWorkingFrom=document.getElementById("selectYearWorkingFrom");
	var selectMonthWorkingFrom=document.getElementById("selectMonthWorkingFrom");
	var selectYearWorkingTill=document.getElementById("selectYearWorkingTill");
	var selectMonthWorkingTill=document.getElementById("selectMonthWorkingTill");
	var organization_description=document.getElementById("organization_description");
	
	var div = document.createElement("div");
	div.className = "card-body";
	
	var node = document.createTextNode(form_organization.value);
	div.appendChild(node);
	textData=textData+'organization:'+form_organization.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(form_designation.value);
	div.appendChild(node);
	textData=textData+'designation:'+form_designation.value+'>)]##[(<';
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(selectMonthWorkingFrom.value+'  '+selectYearWorkingFrom.value);
	div.appendChild(node);
	textData=textData+'MonthWorkingFrom:'+selectMonthWorkingFrom.value+'>)]##[(<';
	textData=textData+'YearWorkingFrom:'+selectYearWorkingFrom.value+'>)]##[(<';
	
	if(isCurrentCompanyNo.checked){
		div.appendChild(document.createElement("br"));
		node = document.createTextNode(selectMonthWorkingTill.value+'  '+selectYearWorkingTill.value);
		div.appendChild(node);
		textData=textData+'MonthWorkingTill:'+selectMonthWorkingTill.value+'>)]##[(<';
		textData=textData+'YearWorkingTill:'+selectYearWorkingTill.value+'>)]##[(<';
	}
	
	div.appendChild(document.createElement("br"));
	node = document.createTextNode(organization_description.value);
	div.appendChild(node);
	textData=textData+'Description:'+organization_description.value;
	
	var div_up = document.createElement("div");
	div_up.className = "card";
	div_up.appendChild(div);
	document.getElementById("addEmploymentDIV").appendChild(div_up);
	
	var textAreaEmployee=document.getElementById("employeDetailsTextArea").value;
	textAreaEmployee=textAreaEmployee+'>)]##[(<>)]##[(<>)]##[(<>)]##[(<'+textData;
	document.getElementById("employeDetailsTextArea").value=textAreaEmployee;
	
	
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

function showDataSave(){
	document.getElementById('li_nav_item_save').hidden = false;
}