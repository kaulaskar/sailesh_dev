# clone the java springboot application link

git clone https://github.com/spring-projects/spring-petclinic.git


# build the java spring-boot application
install maven and java openjdk version "17.0.8.1"

#build jar file command
mvn clean package 


# Creat docker file into cloned folder and build a ocker image and push image to docker hub 

#docker image build and push command 
docker built -t imagename .

docker push imagename:version 


