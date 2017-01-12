FROM centos:7
MAINTAINER asj

LABEL Description="Sample"
USER root
RUN yum install httpd
RUN sed -ie 's/Listen\ 80/Listen\ 8080/g' /etc/httpd/conf/httpd.conf
RUN echo "Hello docker world" > /var/www/html/index.html
RUN chmod a+rwx /run/httpd
RUN chmod a+rwx /etc/httpd/logs
USER nobody
EXPOSE 8080
CMD /usr/sbin/httpd -DFOREGROUND
