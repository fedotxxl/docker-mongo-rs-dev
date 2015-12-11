FROM fbelov/mongo-dev

#port
EXPOSE 27017

#copy docker file
ADD Dockerfile /Dockerfile
ADD rs.initiate.js /rs.initiate.js

#run mongodb
ADD service/mongodb.sh /etc/service/mongodb/run
RUN mkdir /etc/service/mongodb-init
ADD service/rs.initiate.sh /etc/service/mongodb-init/run

#COMMON PARTS FOR MOST CONTAINERS
# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


