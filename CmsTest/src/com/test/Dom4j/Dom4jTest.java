package com.test.Dom4j;

import java.io.*;
import java.net.MalformedURLException;
import java.util.Iterator;

import org.dom4j.*;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class Dom4jTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		createDocument();
		SAXReader reader = new SAXReader();
		Document document = null;
	       try {
			document = reader.read(new File("User.hbm.xml"));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    System.out.println(document.getRootElement().getName());
	    Element root = document.getRootElement();
	    listnode(root);
	}
	
	 public static Document createDocument() {
	       Document document = DocumentHelper.createDocument();
	       Element root = document.addElement("root");
	       Element author1 =
	           root
	              .addElement("author")
	              .addAttribute("name", "James")
	              .addAttribute("location", "UK")
	              .addText("James Strachan");
	       Element author2 =
	           root
	              .addElement("author")
	              .addAttribute("name", "Bob")
	              .addAttribute("location", "US")
	              .addText("Bob McWhirter");
	       Element author3 =
		           root
		              .addElement("author")
		              .addAttribute("name", "jim")
		              .addAttribute("location", "US")
		              .addText("jim wright");
	       OutputFormat format = OutputFormat.createPrettyPrint();
	       XMLWriter writer = null;
		try {
			writer = new XMLWriter(new FileWriter( "User.hbm.xml" ), format);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	           try {
				writer.write( document );
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	           try {
				writer.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       return document;
	    }
     
	 public static Document read(String fileName) throws MalformedURLException, DocumentException {
	       SAXReader reader = new SAXReader();
	       Document document = reader.read(new File(fileName ));
	       return document;
	 }
	 
	 public Element getRootElement(Document doc){
	       return doc.getRootElement();
	 }
	 
	 
//	 public void treeWalk() {
//	       treeWalk(getRootElement());
//	 }

	public void treeWalk(Element element) {
		for (int i = 0, size = element.nodeCount(); i < size; i++) {
			Node node = element.node(i);
			if (node instanceof Element) {
				treeWalk((Element) node);
			} else { // do something....
			}
		}
	}
	//从根节点列出所有元素
	public static void listnode(Element root){
		for ( Iterator i = root.elementIterator(); i.hasNext(); ) {
            Element element = (Element) i.next();
                System.out.println(element.getName()+":"+element.getText());
        }
	}
}
