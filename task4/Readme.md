#### [Link](https://github.com/aleksey-nalivaiko/Internship/tree/master/task4) - Jenkins

#### Point_1. Install Jenkins (you need to use Jenkins in Docker)

Use to build:
`docker build -t jenkins_with_docker`

Use to run the command:

` docker run -d --name jenkins --restart='always' \ `
` -p 8080:8080 \ `
` -v /data/jenkins_home:/var/jenkins_home \ `
` -v /var/run/docker.sock:/var/run/docker.sock \ `
` jenkins_with_docker `

#### Point_2. Install the necessary plugins (if required at your discretion)
#### Point_3. Configure multiple build agents
#### Point_4. Create a Freestyle project. Which will display the current time as a result of execution
#### Point_5. Create a Pipeline that will execute the docker ps -a command on the host
#### Point_6. Create a Pipeline that will download the code from your repository and build the docker image from your Dockerfile (which you wrote when you met with docker)
#### Point_7. Pass the variable PASSWORD = QWERTY! Encrypted to docker container
#### Point_8. Pipeline which will run a docker container from your dockerfile on an additional virtual machine