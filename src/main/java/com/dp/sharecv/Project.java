package com.dp.sharecv;

import java.util.ArrayList;
import java.util.List;

public class Project {
	private String projectName;
	private String clientName;
	private String usedSkills;
	private String fromDate;
	private String toDate;
	private String projectDescription;
	private List<String> responsibilities;

	public Project() {
		this.responsibilities = new ArrayList<String>();
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getUsedSkills() {
		return usedSkills;
	}

	public void setUsedSkills(String usedSkills) {
		this.usedSkills = usedSkills;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getToDate() {
		return toDate;
	}

	public void setToDate(String toDate) {
		this.toDate = toDate;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription;
	}

	public void setResponsibilities(List<String> responsibilities) {
		this.responsibilities.addAll(responsibilities);
	}

	public void setResponsibility(String resp) {
		this.responsibilities.add(resp);
	}

	public List<String> getResponsibilities() {
		return responsibilities;
	}

	@Override
	public String toString() {
		return "Project [projectName=" + projectName + ", clientName=" + clientName + ", usedSkills=" + usedSkills
				+ ", fromDate=" + fromDate + ", toDate=" + toDate + ", projectDescription=" + projectDescription
				+ ", responsibilities=" + responsibilities + "]";
	}

}
