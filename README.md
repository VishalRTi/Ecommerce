# Ecommerce
This Ecommerce WebSite is made with the Hibernate,Servlets,MySQL Database Using Java as a Primary Language.

To Run this Project on your Machine Please Follow:-

1.Go to web.xml file and open the Persistence.xml file(which is present inside meta-inf>classes) and change the UserName,UserPassword of Database and provide the DatabaseName which you have created in your Database.
*.Please dont change the perstistenceName.
2.Install Tomcat apache Server to Execute the WebFile.
3.Run index.jsp page on Tomcat Server.
4.To Access Admin Page please follow:-
i.Go to Register Page and Fill All the Details and Click Register Now.
ii.After Successfull Registration go to your database and open the user entity.
iii.Inside the User Table write update query to make user as admin.
Query:-update user set userType='admin'where userId=1;specify userId According to your Needs.

After Admin Login You Can Add ProductCategory and ProductDetails

Thats All ! Your Project is Up and Running..
