# Re_Forms 21 application instructions

### Project requirements:
 1. Java 8
 2. application server compatible with Servlet API 3.1 (for production deployment)

### Running the project in Re_Forms 21 Studio
##### A. Importing project
 1. Right click within **Package Explorer** view
 2. Select Import -> Maven -> Existing Maven Projects
 3. Browse for **Root Directory** and select the project folder
 4. Select **all** the projects (there should be at least three)
 5. Click **Finish**

##### B. Running the project
 1. Navigate to **Form Explorer**
 2. Select the form you would like to run
 3. Click **Run** button on the toolbar

### Building the WAR archive for production deployment
Below instructions need to be executed in 'Videotron V4.0.1' directory.

Building WAR archive:
* for Tomcat: `mvn clean package`
* for Wildfly: `mvn clean package -Pwildfly`
* for WebLogic: `mvn clean package -Pweblogic`

WAR file location: `video_4.0.1-app-servlet/target/video_4.0.1-app.war`

Application URL in default application server configuration: [http://localhost:8080/video_4.0.1-app/](http://localhost:8080/video_4.0.1-app/)

