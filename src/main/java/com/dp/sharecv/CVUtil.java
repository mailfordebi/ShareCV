package com.dp.sharecv;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.util.StringUtils;

public class CVUtil {

	public final static String EXTRACTOR = "\\>\\)\\]\\#\\#\\[\\(\\<";
	public final static String EMP_EXTRACTOR = "\\>\\)\\]\\#\\#\\[\\(\\<\\>\\)\\]\\#\\#\\[\\(\\<\\>\\)\\]\\#\\#\\[\\(\\<\\>\\)\\]\\#\\#\\[\\(\\<";

	public final static String REGISTER_ERROR = "Unable to registered";
	public final static String REGISTER_SUCCESS = "Successfull registered";
	public final static String USER_ALREADY_EXIST = "User already exist with this email";

	public static byte[] imageResize(byte[] imageContent, String imageName) throws IOException {
		int scaledWidth = 640;
		int scaledHeight = 640;

		InputStream in = new ByteArrayInputStream(imageContent);
		BufferedImage inputImage = ImageIO.read(in);

		BufferedImage outputImage = new BufferedImage(scaledWidth, scaledHeight, inputImage.getType());

		Graphics2D g2d = outputImage.createGraphics();
		g2d.drawImage(inputImage, 0, 0, scaledWidth, scaledHeight, null);
		g2d.dispose();

		String formatName = imageName.substring(imageName.lastIndexOf(".") + 1);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(outputImage, formatName, baos);
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		baos.close();
		return imageInByte;
	}

	public static List<String> splitStringWithDot(String str) {
		List<String> listString = null;
		if (!StringUtils.isEmpty(str)) {
			listString = Arrays.asList(str.split("\\."));
		} else {
			listString = new ArrayList<String>();
		}
		return listString;
	}

	public static List<String> extractString(String str, String substr) {
		List<String> listString = null;
		if (!StringUtils.isEmpty(str)) {
			listString = new ArrayList(Arrays.asList(str.split(substr)));
		} else {
			listString = new ArrayList<String>();
		}
		listString.removeAll(Collections.singleton(null));
		listString.removeAll(Collections.singleton(""));
		return listString;
	}

	public static void main(String[] args) {

		System.out.println("debi:".substring(5));
	}

}
