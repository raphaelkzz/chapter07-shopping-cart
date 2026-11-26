# Chapter 7 Shopping Cart

Java Servlet/JSP recreation of the CD cart demonstrated at <https://ltwebbt3.onrender.com/>. It lists four CDs and supports adding an item, changing quantity, removing an item, continuing shopping, and viewing a checkout summary. The cart lives in the HTTP session. Checkout is a classroom demonstration; it does not process payments or persist orders.

## Run locally

Use Java 17 and Maven to run `mvn clean package`, then deploy `target/ROOT.war` to Tomcat 10.1. The app is available at the Tomcat root URL. To build the Docker image after changing the source, copy `target/ROOT.war` to `deploy/ROOT.war` and publish port 10000.

## Render

The free Docker web service uses the prebuilt WAR in `deploy/ROOT.war`, so Render does not need to download Maven dependencies during each deploy. The startup script configures Tomcat to listen on Render's `PORT` environment variable, defaulting to 10000.
