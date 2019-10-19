package com.dp.sharecv;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "cv")
public class CVInfo {
	@Id
	private String email_id;
	private String fullName;
	private String email;
	private List<String> phoneNos;
	private String phoneNumbers;
	private List<String> websites;
	private String website;
	private String address1;
	private String address2;
	private String facebook;
	private String twitter;
	private String github;
	private String stackoverflow;
	private String linkedin;
	private String profileImage;
	private List<String> skills;
	private List<Employement> employements;
	private List<Education> educations;
	private List<Project> projects;
	private List<String> profileSummaries;
	private Map<String, String> newSummary;

	public CVInfo() {
		phoneNos = new ArrayList<String>();
		websites = new ArrayList<String>();
		skills = new ArrayList<String>();
		employements = new ArrayList<Employement>();
		educations = new ArrayList<Education>();
		projects = new ArrayList<Project>();
		profileSummaries = new ArrayList<String>();
		newSummary = new HashMap<String, String>();
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<String> getPhoneNos() {
		return phoneNos;
	}

	public void setPhoneNos(String phoneNo) {
		this.phoneNos.add(phoneNo);
	}

	public List<String> getWebsites() {
		return websites;
	}

	public void setWebsites(String website) {
		this.websites.add(website);
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public List<String> getSkills() {
		return skills;
	}

	public void setSkill(String skill) {
		this.skills.add(skill);
	}

	public void setSkills(List<String> skills) {
		this.skills.addAll(skills);
	}

	public List<Employement> getEmployements() {
		return employements;
	}

	public void setEmployements(Employement employement) {
		this.employements.add(employement);
	}

	public List<Education> getEducations() {
		return educations;
	}

	public void setEducations(Education education) {
		this.educations.add(education);
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(Project project) {
		this.projects.add(project);
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getGithub() {
		return github;
	}

	public void setGithub(String github) {
		this.github = github;
	}

	public String getStackoverflow() {
		return stackoverflow;
	}

	public void setStackoverflow(String stackoverflow) {
		this.stackoverflow = stackoverflow;
	}

	public String getLinkedin() {
		return linkedin;
	}

	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}

	public List<String> getProfileSummaries() {
		return profileSummaries;
	}

	public void setProfileSummaries(List<String> summary) {
		this.profileSummaries.addAll(summary);
	}

	public void setProfileSummary(String summary) {
		this.profileSummaries.add(summary);
	}

	public Map<String, String> getNewSummary() {
		return newSummary;
	}

	public void setNewSummary(String key, String value) {
		this.newSummary.put(key, value);
	}

	public String getEmail_id() {
		return email_id;
	}

	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}

	public String getPhoneNumbers() {
		return phoneNumbers;
	}

	public void setPhoneNumbers(String phoneNumbers) {
		this.phoneNumbers = phoneNumbers;
	}
	
	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Override
	public String toString() {
		return "CVInfo [email_id=" + email_id + ", fullName=" + fullName + ", email=" + email + ", phoneNos=" + phoneNos
				+ ", websites=" + websites + ", address1=" + address1 + ", address2=" + address2 + ", facebook="
				+ facebook + ", twitter=" + twitter + ", github=" + github + ", stackoverflow=" + stackoverflow
				+ ", linkedin=" + linkedin + ", profileImage=" + profileImage + ", skills=" + skills + ", employements="
				+ employements + ", educations=" + educations + ", projects=" + projects + ", profileSummaries="
				+ profileSummaries + ", newSummary=" + newSummary + "]";
	}

}
