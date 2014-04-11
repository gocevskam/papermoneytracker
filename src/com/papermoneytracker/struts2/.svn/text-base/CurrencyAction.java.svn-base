package com.papermoneytracker.struts2;

import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Uses the ECB API for currencies' history to retrieve the currency status of
 * the EUR vs USD on the date the bill was tracked at a certain location.
 */
public class CurrencyAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	public URL apiUrl;

	String currency = "USD";

	String input;
	String output = "sample";
	
	public String execute() {
		try {
			apiUrl = new URL("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.xml");
		} catch(Exception e) {
			e.printStackTrace();
		}
		formatDate();
		parse(apiUrl);
		System.out.println(output);
		return SUCCESS;
	}
	
	private void formatDate() {
		//Dec 11, 2013 6:01:54 PM
		SimpleDateFormat inputD = new SimpleDateFormat("MMM dd, yyyy H:mm:ss aa");
		SimpleDateFormat outputD = new SimpleDateFormat("yyyy-MM-dd");
		String result = null;
		try {
			Date date = inputD.parse(input);
			result = outputD.format(date);
		} catch (ParseException exception) {
			System.out.println("Parsing failed for " + input);
			System.err.println(exception.getMessage());
		}
		input = result;
	}
	
	private String parse(URL url) {
		try {
			DefaultHandler handler = new SaxHandler();
			SAXParser parser = SAXParserFactory.newInstance().newSAXParser();
			parser.parse(url.toString(), handler);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return output;
	}

	class SaxHandler extends DefaultHandler {
		boolean foundDate = false;
		int cubeLevel = 0;
		
		public void startElement(String uri, String localName, String qName,
				Attributes attributes) throws SAXException {
			/* Increment Cube level when you 
			 * encounter an opening Cube element */
			if (qName.equals("Cube")) {
				cubeLevel++;
				
				/* If you find the correct date attribute, flag for
				 * correct Cube level block */
				if ((attributes.getValue("time") != null) && (attributes.getValue("time").equals(input))) {
					foundDate = true;
				}
			}
	
			/* If the date block is correct and the correct currency 
			 * element is encountered, get the rate as result */
			if (foundDate) {
				if (qName.equals("Cube") && (attributes.getValue("currency") != null)) {
					if (attributes.getValue("currency").equals(currency)) {
						output = attributes.getValue("rate");
						System.err.println(output);
					}
				}
			}
		}

		public void endElement(String uri, String localName, String qName)
				throws SAXException {
			// Decrement Cube level when you encounter a </Cube>
			if (qName.equals("Cube")) {
				cubeLevel--;
			}
			/* Disable searching for rate when you leave
			 * a Cube element on level 2 */
			if (qName.equals("Cube") && (cubeLevel == 2)) {
				foundDate = false;
			}
		}

		public void characters(char ch[], int start, int length)
				throws SAXException {

		}

		public void endDocument() throws SAXException {

		}
	}
	
	public String getInput() {
		return input;
	}

	public void setInput(String requestedDate) {
		this.input = requestedDate;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}
}
