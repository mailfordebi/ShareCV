package com.dp.sharecv;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.antlr.stringtemplate.StringTemplate;
import org.antlr.stringtemplate.StringTemplateGroup;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.TagNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.Pipeline;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;

@Controller
@SessionAttributes({ "cvInfo", "isLoggedIn", "user", "username" })
public class ShareCVController {

	@Autowired
	private CVDao cvDao;

	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping("/resume")
	public ModelAndView resumeBuilder() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("resume_builder");
		return modelAndView;
	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam("page") String page) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("page", page);
		modelAndView.setViewName("login");
		return modelAndView;
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("isLoggedIn", false);
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@RequestMapping(value = "/{email}", method = RequestMethod.GET)
	public ModelAndView getProfile(@PathVariable("email") String email, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();

		CVInfo cv = cvDao.getCVDetails(email);
		modelAndView.addObject("cvInfo", cv);
		request.getSession().setAttribute("cvInfo", cv);
		modelAndView.setViewName("publish_cv");
		return modelAndView;
	}

	@RequestMapping(value = "/resetpassword", method = RequestMethod.POST)
	public ModelAndView resetPassword(@RequestParam("resetEmail") String email,
			@RequestParam("reset_pass") String password, @RequestParam("reset_pass_again") String re_password,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		if (StringUtils.isEmpty(password) || StringUtils.isEmpty(re_password) || (!password.equals(re_password))) {
			modelAndView.addObject("isLoggedIn", false);
			modelAndView.addObject("error", "Password are not matching");
			modelAndView.setViewName("login");
		} else {
			User user = cvDao.getUserDetails(email, null);
			if (user == null) {
				modelAndView.addObject("isLoggedIn", false);
				modelAndView.addObject("error", "User doesn't exist with this email.");
				modelAndView.setViewName("login");
			} else {
				User user_1 = new User();
				user_1.setEmail(email);
				user_1.setPassword(password);
				if (cvDao.updateUser(user_1)) {
					modelAndView.addObject("isLoggedIn", true);
					modelAndView.addObject("error", "Password updated");
					modelAndView.setViewName("login");
				} else {
					modelAndView.addObject("isLoggedIn", false);
					modelAndView.addObject("error", "Unable to upadate password");
					modelAndView.setViewName("login");
				}
			}
		}
		return modelAndView;
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView signup(@RequestParam("user_name") String name, @RequestParam("user_email") String email,
			@RequestParam("user_pass") String password, HttpServletRequest request) {
		User user = new User();
		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		ModelAndView modelAndView = new ModelAndView();
		String msg = cvDao.newUser(user);
		if (CVUtil.REGISTER_SUCCESS.equalsIgnoreCase(msg)) {
			modelAndView.addObject("isLoggedIn", true);
			modelAndView.addObject("user", user);
			if (!StringUtils.isEmpty(user.getName())) {
				String userLastName = user.getName().substring(user.getName().lastIndexOf(" ") + 1);
				modelAndView.addObject("username", userLastName);
			}
			modelAndView.setViewName("index");
		} else {
			modelAndView.addObject("isLoggedIn", false);
			modelAndView.addObject("error", msg);
			modelAndView.setViewName("login");
		}
		return modelAndView;
	}

	@RequestMapping("/pdf")
	public ModelAndView pdf() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("final_cv");
		return modelAndView;
	}

	@RequestMapping("/downloadPublishedCV")
	public void downloadPublishedCV(HttpServletResponse response) throws Exception {
		downloadPDF(response);
	}

	@RequestMapping(value = "/downloadPDF", method = RequestMethod.POST)
	public void downloadPDF(HttpServletResponse response) throws Exception {
		OutputStream os = null;
		try {

			StringTemplate page = getStringTemplate();

			String content = page.toString();

			final HtmlCleaner htmlCleaner = new HtmlCleaner();
			final TagNode tagNode = htmlCleaner.clean(content);
			content = htmlCleaner.getInnerHtml(tagNode);

			os = response.getOutputStream();

			Document document = null;

			document = new Document(PageSize.A4);

			final ByteArrayOutputStream baos = new ByteArrayOutputStream();
			final PdfWriter writer = PdfWriter.getInstance(document, baos);
			document.open();

			final HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);

			htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

			final CSSResolver cssResolver = XMLWorkerHelper.getInstance().getDefaultCssResolver(true);
			final Pipeline<?> pipeline = new CssResolverPipeline(cssResolver,
					new HtmlPipeline(htmlContext, new PdfWriterPipeline(document, writer)));
			final XMLWorker worker = new XMLWorker(pipeline, true);
			final XMLParser parser = new XMLParser(worker);

			try {
				parser.parse(new StringReader(content));
			} catch (final Exception e) {
				e.printStackTrace();

			}

			document.close();
			response.setContentType("Content-Type: text/html; charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment; filename=my_cv.pdf");
			response.setContentLength(baos.size());
			baos.writeTo(os);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (os != null) {
					os.flush();
					os.close();
				}
			} catch (final IOException e) {
				e.printStackTrace();
			}
		}
	}

	StringTemplate getStringTemplate() {
		final StringTemplateGroup group = new StringTemplateGroup("Generators");
		return group.getInstanceOf("pdf_template");
	}

	@RequestMapping(value = "/login_submit", method = RequestMethod.POST)
	public ModelAndView loginSubmit(@RequestParam("inputEmail") String inputEmail,
			@RequestParam("inputPassword") String inputPassword, @RequestParam("nextPage") String nextPage,
			HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		User user = cvDao.getUserDetails(inputEmail, inputPassword);
		modelAndView.addObject("user", user);
		if (user != null) {
			modelAndView.addObject("isLoggedIn", true);
			if (!StringUtils.isEmpty(user.getName())) {
				String userLastName = user.getName().substring(user.getName().lastIndexOf(" ") + 1);
				modelAndView.addObject("username", userLastName);
			}
			CVInfo cv = (CVInfo) request.getSession().getAttribute("cvInfo");
			modelAndView.addObject("cvInfo", cv);
			if (!StringUtils.isEmpty(nextPage)) {
				modelAndView.setViewName(nextPage);
			} else {
				modelAndView.setViewName("index");
			}
		} else {
			modelAndView.addObject("isLoggedIn", false);
			modelAndView.addObject("error", "Please enter correct username and password.");
			modelAndView.setViewName("login");
		}
		return modelAndView;
	}

	@RequestMapping(value = "/resume_action_submit", method = RequestMethod.POST)
	public ModelAndView resumeActionSubmit(@RequestParam("fullName") String fullName,
			@RequestParam("email") String email, @RequestParam("phone") String phone,
			@RequestParam("websites") String websites, @RequestParam("address1") String address1,
			@RequestParam("address2") String address2, @RequestParam("facebook") String facebook,
			@RequestParam("twitter") String twitter, @RequestParam("github") String github,
			@RequestParam("stackoverflow") String stackoverflow, @RequestParam("linkedin") String linkedin,
			@RequestParam("imgProfile") MultipartFile imgProfile,
			@RequestParam("skillSetTextArea") String skillSetTextArea,
			@RequestParam("employeDetailsTextArea") String employeDetailsTextArea,
			@RequestParam("educationDetailsTextArea") String educationDetailsTextArea,
			@RequestParam("projectDetailsTextArea") String projectDetailsTextArea,
			@RequestParam("profileSummaryTextArea") String profileSummaryTextArea,
			@RequestParam("newSummaryTextArea1") String newSummaryTextArea1,
			@RequestParam("newSummaryInput1") String newSummaryInput1,
			@RequestParam("newSummaryTextArea2") String newSummaryTextArea2,
			@RequestParam("newSummaryInput2") String newSummaryInput2,
			@RequestParam("newSummaryTextArea3") String newSummaryTextArea3,
			@RequestParam("newSummaryInput3") String newSummaryInput3,
			@RequestParam("newSummaryTextArea4") String newSummaryTextArea4,
			@RequestParam("newSummaryInput4") String newSummaryInput4) {

		CVInfo cvInfo = new CVInfo();
		cvInfo.setFullName(fullName);
		cvInfo.setEmail(email);
		if (!StringUtils.isEmpty(phone)) {
			StringTokenizer tokenizer = new StringTokenizer(phone, ",");
			while (tokenizer.hasMoreElements()) {
				String ph = (String) tokenizer.nextElement();
				if (!StringUtils.isEmpty(phone)) {
					cvInfo.setPhoneNos(ph);
				}
			}

		}

		if (!StringUtils.isEmpty(websites)) {
			StringTokenizer tokenizer = new StringTokenizer(websites, ",");
			while (tokenizer.hasMoreElements()) {
				String wb = (String) tokenizer.nextElement();
				if (!StringUtils.isEmpty(wb)) {
					cvInfo.setWebsites(wb);
				}
			}

		}

		cvInfo.setAddress1(address1);
		cvInfo.setAddress2(address2);
		cvInfo.setFacebook(facebook);
		cvInfo.setTwitter(twitter);
		cvInfo.setGithub(github);
		cvInfo.setStackoverflow(stackoverflow);
		cvInfo.setLinkedin(linkedin);
		String image = "";
		byte[] imageContent = null;
		try {
			if (!imgProfile.isEmpty()) {
				String imageName = imgProfile.getOriginalFilename();
				imageContent = CVUtil.imageResize(imgProfile.getBytes(), imageName);

			} else {
				File fi = new File(getClass().getClassLoader().getResource("profile.jpg").getFile());
				imageContent = CVUtil.imageResize(Files.readAllBytes(fi.toPath()), fi.getName());
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		image = Base64.getEncoder().encodeToString(imageContent);
		cvInfo.setProfileImage(image);

		cvInfo.setProfileSummaries(CVUtil.splitStringWithDot(profileSummaryTextArea));
		cvInfo.setSkills(CVUtil.extractString(skillSetTextArea, CVUtil.EXTRACTOR));

		List<String> employmentList = CVUtil.extractString(employeDetailsTextArea, CVUtil.EMP_EXTRACTOR);
		for (String str : employmentList) {
			Employement employement = new Employement();
			if (!str.contains("MonthWorkingTill:") && !str.contains("YearWorkingTill:")) {
				employement.setCurrentCompany(true);
			}
			List<String> expDetails = CVUtil.extractString(str, CVUtil.EXTRACTOR);
			for (String st : expDetails) {
				int index = st.indexOf(':');
				if (st.contains("organization:")) {
					employement.setOrganisation(st.substring(index + 1));
				}
				if (st.contains("designation:")) {
					employement.setDesignation(st.substring(index + 1));
				}
				if (st.contains("MonthWorkingFrom:")) {
					employement.setMonthWorkingFrom(st.substring(index + 1));
				}
				if (st.contains("YearWorkingFrom:")) {
					employement.setYearWorkingFrom(st.substring(index + 1));
				}
				if (st.contains("MonthWorkingTill:")) {
					employement.setMonthWorkingTill(st.substring(index + 1));
				}
				if (st.contains("YearWorkingTill:")) {
					employement.setYearWorkingTill(st.substring(index + 1));
				}
				if (st.contains("Description:")) {
					String desc = st.substring(index + 1);
					employement.setDescriptions(CVUtil.splitStringWithDot(desc));
				}
			}
			cvInfo.setEmployements(employement);
		}

		List<String> educationList = CVUtil.extractString(educationDetailsTextArea, CVUtil.EMP_EXTRACTOR);
		for (String str : educationList) {
			Education education = new Education();
			List<String> educationDetails = CVUtil.extractString(str, CVUtil.EXTRACTOR);
			for (String st : educationDetails) {
				int index = st.indexOf(':');
				if (st.contains("Education:")) {
					education.setEducation(st.substring(index + 1));
				}
				if (st.contains("Specililization:")) {
					education.setSpecialization(st.substring(index + 1));
				}
				if (st.contains("University:")) {
					education.setInstitute(st.substring(index + 1));
				}
				if (st.contains("Passing Out:")) {
					education.setPassoutYear(st.substring(index + 1));
				}
				if (st.contains("Grade/Percentage:")) {
					String mark = st.substring(index + 1);
					if (!mark.contains("%")) {
						education.setGpa(false);
					}
					education.setPercentage(mark);
				}
			}
			cvInfo.setEducations(education);
		}

		List<String> projectList = CVUtil.extractString(projectDetailsTextArea, CVUtil.EMP_EXTRACTOR);
		for (String str : projectList) {
			Project project = new Project();
			List<String> projectDetails = CVUtil.extractString(str, CVUtil.EXTRACTOR);
			for (String st : projectDetails) {
				int index = st.indexOf(':');
				if (st.contains("Project:")) {
					project.setProjectName(st.substring(index + 1));
				}
				if (st.contains("Client:")) {
					project.setClientName(st.substring(index + 1));
				}
				if (st.contains("Skills:")) {
					project.setUsedSkills(st.substring(index + 1));
				}
				if (st.contains("FromProjectDate:")) {
					project.setFromDate(st.substring(index + 1));
				}
				if (st.contains("ToProjectDate:")) {
					project.setToDate(st.substring(index + 1));
				}
				if (st.contains("Description:")) {
					project.setProjectDescription(st.substring(index + 1));
				}
				if (st.contains("Roles and Responsiblilities:")) {
					String responsibility = st.substring(index + 1);
					project.setResponsibilities(CVUtil.splitStringWithDot(responsibility));
				}
			}
			cvInfo.setProjects(project);
		}

		if (!StringUtils.isEmpty(newSummaryInput1)) {
			cvInfo.setNewSummary(newSummaryInput1, newSummaryTextArea1);
		}
		if (!StringUtils.isEmpty(newSummaryInput2)) {
			cvInfo.setNewSummary(newSummaryInput2, newSummaryTextArea2);
		}
		if (!StringUtils.isEmpty(newSummaryInput3)) {
			cvInfo.setNewSummary(newSummaryInput3, newSummaryTextArea3);
		}
		if (!StringUtils.isEmpty(newSummaryInput4)) {
			cvInfo.setNewSummary(newSummaryInput4, newSummaryTextArea4);
		}

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cvInfo", cvInfo);
		modelAndView.setViewName("profile");
		return modelAndView;

	}

	@RequestMapping("/saveCV")
	public ModelAndView saveCV(HttpServletRequest request) {
		CVInfo cv = (CVInfo) request.getSession().getAttribute("cvInfo");
		User user = (User) request.getSession().getAttribute("user");
		cv.setEmail_id(user.getEmail());
		if (cvDao.saveCV(cv)) {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("cvInfo", cv);
			modelAndView.setViewName("publish_cv");
			return modelAndView;
		} else {
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("saveerror", "Unable to save");
			modelAndView.setViewName("publish_cv");
			return modelAndView;
		}

	}
}