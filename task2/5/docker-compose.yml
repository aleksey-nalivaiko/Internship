version: "3.7"
   
services:
  web:
    image: alekseynalivaiko/internship:latest
	container_name: web
    expose:
      - "8081"
    ports:
      - "80"
    deploy:
      mode: replicated
      replicas: 5
      
  app:
    image: jenkins/jenkins:latest
    container_name: app
    ports:
      - "8082:8080" 
    depends_on:
      - db

  db:
    image: postgres:latest
    container_name: db
	ports:
	  - "5432:5432"
	env_file:
      - ./database.env