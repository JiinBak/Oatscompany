package com.oatscompany.controller;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.opencsv.CSVReader;
import com.opencsv.CSVWriter;


@Controller
public class DataController {

	String pattern = "yyyy-MM-dd";
	SimpleDateFormat format = new SimpleDateFormat(pattern);
	
	String accessKey = "AKIAJKU4E4UHGYLTNLOQ";
	String secretKey = "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";

	@RequestMapping("/result")
	public String insert(HttpServletRequest request) throws IOException {
			
		request.setCharacterEncoding("UTF-8");
		String x_coordinate = request.getParameter("lat");
		String y_coordinate = request.getParameter("long");
		String address = request.getParameter("address");
		String sido = address.split(" ")[1];
		String sigungu = address.split(" ")[2];
		String eupmyeondong = address.split(" ")[3];
		String local_id = "";
		String selecteddate = request.getParameter("selecteddate");

		//지역아이디 구하는 부분
		ClassLoader classLoader = getClass().getClassLoader();
		File file = new File(classLoader.getResource("region/administrative_district.csv").getFile());
		CSVReader reader = new CSVReader(new FileReader(file));
		String [] nextLine;
			while ((nextLine = reader.readNext()) != null) {
				if (nextLine[3].equals(eupmyeondong) ) {
					System.out.println(eupmyeondong);
							local_id = nextLine[0];
							break;
						}
					} 
		reader.close();
		
		//csv파일 저장하는 부분

		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date nowDate = new Date();
		String stringDate = sdFormat.format(nowDate);
		String path = request.getSession().getServletContext().getRealPath("/")+"WEB-INF\\region\\";

		String csv = path + stringDate +".csv";
		CSVWriter writer = new CSVWriter(new FileWriter(csv), ',', CSVWriter.NO_QUOTE_CHARACTER, CSVWriter.NO_ESCAPE_CHARACTER, System.getProperty("line.separator"));
		String[] column = new String[] {"x_coordinate", "y_coordinate", "address", "sido", "sigungu", "eupmyeondong", "local_id", "selecteddate"};
		String[] record = new String[] {x_coordinate, y_coordinate, address, sido, sigungu, eupmyeondong, local_id, selecteddate };
		writer.writeNext(column);
		writer.writeNext(record);
		writer.close();
		
		
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		final AmazonS3 s3 = new AmazonS3Client(credentials);
		s3.putObject("oatsdata/userdata", stringDate+".csv", new File(csv));
		
		
		
		return "result";
	}
	
	@RequestMapping("/uichan")
	public String showUichan() {
		return "uichan";
	}
	
	@RequestMapping("/seongho")
	public String showSeongho() {
		return "seongho";
	}
	
	@RequestMapping("/jiin")
	public String showJiin() {
		return "jiin";
	}
	
	@RequestMapping("/BarChart")
	public String showBarChart() {
		return "BarChart";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
