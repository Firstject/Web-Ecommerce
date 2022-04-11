# Web-Ecommerce
Web Programming Project

# Deprecated Project Note
This project requires Netbeans 8.2 and JDK 1.8.0. Newer versions might not work properly.

# Setting up your server

## Apache Netbeans IDE
Follow these instructions to add the GlassFish Server to NetBeans IDE.
1. Select Tools -> Servers to open the Servers dialog.
1. Click Add Server.
1. Under Choose Server, select GlassFish v5.1.0 and click Next.
1. Under Server Location, browse the location of your GlassFish Server installation and click Next.
1. Click Finish

Database Connections for a Data Source in this project will have a reference missing and need to be located manually. A Java DB named `wareModel` need to be created first.
1. To create one, click the Services tab and Right-click **Java DB** under the **Databases** node and select Create Database to open the database creation dialog.
1. Create a Java DB Database in the name of `wareModel`. User name and password may not need to be entered.
1. Click Finish.

To reference to the Java DB you've created earlier, a database connection have to be created.
1. Click the Services tab.
1. Right-click the Databases node and select New Connection to open the New Connection dialog.
1. Under Driver dropdown menu, choose Java DB (Network) then Click Next.
1. Set Host to `localhost` and Port to `1527`
1. Set Database to `wareModel`.
1. Set User Name to `app`.
1. Set Password to `app`.
1. Select the Remember Password during this Session box.
1. Test Connection to make sure the database works. When the connection is succeeded, click Next.
1. Select schema: `APP`
1. Click Finish.

## Eclipse
To be added...

## IntelliJ IDEA
To be added...

# Updating Controller and Model classes from SQL
If there is any change made on SQL file, all model and controller classes may need to be updated. 
- Delete all entity classes from database and create it again.
- Delete all JPA controllers and recreate them all.