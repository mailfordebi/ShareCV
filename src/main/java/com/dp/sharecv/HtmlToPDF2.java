package com.dp.sharecv;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.apache.commons.io.FileUtils;

import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class HtmlToPDF2 {
	public static void main(String... args) {
		try {

			ByteArrayInputStream html = new ByteArrayInputStream(
					FileUtils.readFileToByteArray(new File("D:\\git\\ShareCV\\src\\main\\resources\\final_cv1.html")));
			Document document = new Document();
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("D:\\WS1\\test.pdf"));
			document.open();
			XMLWorkerHelper.getInstance().parseXHtml(writer, document, html);
			document.close();

			System.out.println("Done.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
