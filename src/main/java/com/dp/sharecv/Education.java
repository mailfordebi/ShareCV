package com.dp.sharecv;

public class Education {
	private String education;
	private String specialization;
	private String institute;
	private String passoutYear;
	private String percentage;
	private boolean gpa;

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public String getPassoutYear() {
		return passoutYear;
	}

	public void setPassoutYear(String passoutYear) {
		this.passoutYear = passoutYear;
	}

	public String getPercentage() {
		return percentage;
	}

	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}

	public boolean isGpa() {
		return gpa;
	}

	public void setGpa(boolean gpa) {
		this.gpa = gpa;
	}

	@Override
	public String toString() {
		return "Education [education=" + education + ", specialization=" + specialization + ", institute=" + institute
				+ ", passoutYear=" + passoutYear + ", percentage=" + percentage + ", gpa=" + gpa + "]";
	}

}
