papermoneytracker
=================

Paper Money Tracker is an application that keeps track of where a euro bill has been before, who had it and how did they get it. A bill can be tracked by its serial number. A serial number, representing the bill, can be entered from different locations. These locations together form a trail. A trail is a geographical path with locations that contain information about where a bill was at a certain point in time. 
Architecture of the application 
 
The application is developed using the Struts 2 framework, which is a Java MVC framework for web development. 
 
A user interacts with the application via Java Server Pages (JSP). Those interactions with the pages are handled by the Apache Tomcat Server, which invokes the appropriate Struts 2 Java actions. Those actions can be used to retrieve data from the database to update a part of the currently viewed page, for example when using AJAX.  
 
For this project we used Hibernate which creates a database out of the java classes, using Java annotations. We used Apache Derby database. Data Access Objects (DAOs) are used to query the database.
