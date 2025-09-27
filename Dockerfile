#base image #instead of installing all below node manuallly on ubuntu we can use lightweight already build image for node that is alpine it save space 
#before using alpine it was arround 300mb but now it got half of it 
#FROM ubuntu
FROM node:22-alpine   


#installing node in ubuntu image 
# RUN  apt-get update 
# RUN apt install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_22.x -o /tmp/nodesource_setup.sh
# RUN bash /tmp/nodesource_setup.sh
# RUN apt install -y nodejs

#copying source code to docker image Syntax copy sourc destination 
COPY index.js /home/app/index.js
COPY package-lock.json /home/app/package-lock.json
COPY package.json /home/app/package.json



WORKDIR /home/app 

RUN npm install 

#CMD ["npm" , "start"]  this is for after building this docker file this cmd will automatically start the server if run docker file 
CMD ["npm" , "start"]