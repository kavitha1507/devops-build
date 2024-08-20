Steps involved
1. Created the docker file using light-weight Nginx image and expose to PORT 80
2. -Created the Docker-compose yaml file for the 'web'service to build docker image
   -Exposed to port 80
   -Mounted a current director(.) to 'usr/share/nginx/html' in container that contains static files
   -Restart the container automatically if it gets crashed
3. Created the scripting files (build.bat) to build the docker image (pipeline-demo-project-react-app)
4. Created the scripting files (deploy.bat) to build the docker image
5. Pushed into Github 'dev' branch
6. Created the DockerHub repos ('dev' as Public) and ('prod' as Private) and pushed the images0.
   Image names-kavi740/pipeline-demo-project-react-app-prod and kavi740/pipeline-demo-project-react-app-dev
7. created a Jenkins pipeline job (to make this build automatic)
8. used prometheus and grafana for monitoring health check of the application.
