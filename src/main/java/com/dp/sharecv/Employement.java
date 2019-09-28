package com.dp.sharecv;

import java.util.ArrayList;
import java.util.List;

public class Employement {
	private String organisation;
	private String designation;
	private String monthWorkingFrom;
	private String yearWorkingFrom;
	private String monthWorkingTill;
	private String yearWorkingTill;
	private List<String> descriptions;
	private boolean currentCompany;

	public Employement() {
		this.descriptions = new ArrayList<String>();
	}

	public String getOrganisation() {
		return organisation;
	}

	public void setOrganisation(String organisation) {
		this.organisation = organisation;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getMonthWorkingFrom() {
		return monthWorkingFrom;
	}

	public void setMonthWorkingFrom(String monthWorkingFrom) {
		this.monthWorkingFrom = monthWorkingFrom;
	}

	public String getYearWorkingFrom() {
		return yearWorkingFrom;
	}

	public void setYearWorkingFrom(String yearWorkingFrom) {
		this.yearWorkingFrom = yearWorkingFrom;
	}

	public String getMonthWorkingTill() {
		return monthWorkingTill;
	}

	public void setMonthWorkingTill(String monthWorkingTill) {
		this.monthWorkingTill = monthWorkingTill;
	}

	public String getYearWorkingTill() {
		return yearWorkingTill;
	}

	public void setYearWorkingTill(String yearWorkingTill) {
		this.yearWorkingTill = yearWorkingTill;
	}

	public boolean isCurrentCompany() {
		return currentCompany;
	}

	public void setCurrentCompany(boolean currentCompany) {
		this.currentCompany = currentCompany;
	}

	public List<String> getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(List<String> descriptions) {
		this.descriptions.addAll(descriptions);
	}

	public void setDescription(String description) {
		this.descriptions.add(description);
	}

	@Override
	public String toString() {
		return "Employement [organisation=" + organisation + ", designation=" + designation + ", monthWorkingFrom="
				+ monthWorkingFrom + ", yearWorkingFrom=" + yearWorkingFrom + ", monthWorkingTill=" + monthWorkingTill
				+ ", yearWorkingTill=" + yearWorkingTill + ", descriptions=" + descriptions + ", currentCompany="
				+ currentCompany + "]";
	}

}
