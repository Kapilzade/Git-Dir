FROM centos:7

MAINTAINER kapilzade26@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O  https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.83/bin/apache-tomcat-8.5.83.tar.gz
RUN tar xvzf apache-tomcat*
RUN mv apache-tomcat-8.5.83/* /opt/tomcat/.
RUN yum update -y
RUN yum install java-openjdk -y
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
