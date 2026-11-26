# Chapter 7 Shopping Cart

Java Servlet/JSP recreation of the CD cart demonstrated at <https://ltwebbt3.onrender.com/>. It lists four CDs and supports adding an item, changing quantity, removing an item, continuing shopping, and viewing a checkout summary. The cart lives in the HTTP session. Checkout is a classroom demonstration; it does not process payments or persist orders.

## Run locally

Use Java 17 and Maven to run `mvn clean package`, then deploy `target/ROOT.war` to Tomcat 10.1. The app is available at the Tomcat root URL. Or build the Dockerfile and publish port 10000.

## Render

Create a free Docker web service from this repository. The startup script configures Tomcat to listen on Render's `PORT` environment variable, defaulting to 10000.
