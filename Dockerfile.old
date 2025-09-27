#base image #instead of installing all below node manuallly on ubuntu we can use lightweight already build image for node that is alpine it save space 
#before using alpine it was arround 300mb but now it got half of it 
#FROM ubuntu
FROM node:22-alpine   

WORKDIR /home/app 

#installing node in ubuntu image 
# RUN  apt-get update 
# RUN apt install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
# RUN bash /tmp/nodesource_setup.sh
# RUN apt install -y nodejs

#copying source code to docker image Syntax copy sourc destination 
COPY package*.json .
#move packagelock json cause for if changes in package then run npm i otherwise it cached it and take less time for build 

RUN npm install 
COPY Dockerfile Dockerfile
COPY index.js index.js



EXPOSE 8000

#CMD ["npm" , "start"]  this is for after building this docker file this cmd will automatically start the server if run docker file 
CMD ["npm" , "start"]