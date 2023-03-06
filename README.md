# Ecommerce
This Ecommerce WebSite is made with the Hibernate,Servlets,MySQL Database Using Java as a Primary Language.

To Run this Project on your Machine Please Follow:-

1.Go to web.xml file and open the Persistence.xml file(which is present inside meta-inf>classes) and change the UserName,UserPassword of Database and provide the DatabaseName which you have created in your Database.<br>
*.Please dont change the perstistenceName.<br>
2.Install Tomcat apache Server to Execute the WebFile.<br>
3.Run index.jsp page on Tomcat Server.<br><br>
4.To Access Admin Page please follow:-<br><br>
i.Go to Register Page and Fill All the Details and Click Register Now.<br>
ii.After Successfull Registration go to your database and open the user entity.<br>
iii.Inside the User Table write update query to make user as admin.<br><br>
Query:-update user set userType='admin' where userId=1;  specify userId According to your Needs.<br>

After Admin Login You Can Add ProductCategory and ProductDetails<br>

Thats All ! Your Project is Up and Running..<br>
