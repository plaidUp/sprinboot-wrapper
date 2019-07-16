# Front End Wrapper

This project can be used as a wrapper for deploying SPA to prod. 
It is a Spring Boot app with an embedded Tomcat server that points to the
`/src/main/resources/static` directory by default. By copying the `dist` build directory
from the SPA, the Spring Boot app can deploy the front-end application. 

To use this to deploy, write a script to delete the contents of the `static` directory
and copy the contents of the `dist` directory there. Build the Spring Boot application, 
and your project should be up and running. 
