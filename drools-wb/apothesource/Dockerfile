#####################################################################################
# Dockerfile that provides the image for JBoss Drools Workbench 7.18.0.Final Showcase
#####################################################################################

####### BASE ############
FROM jboss/drools-workbench:7.18.0.Final

####### ENVIRONMENT ############
# Use demo and examples by default in this showcase image (internet connection required).
ENV KIE_SERVER_PROFILE standalone-full-drools
ENV JAVA_OPTS -Xms256m -Xmx2048m -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8

####### Drools Workbench CUSTOM CONFIGURATION ############
ADD etc/standalone-full-drools.xml $JBOSS_HOME/standalone/configuration/standalone-full-drools.xml
ADD etc/drools-users.properties $JBOSS_HOME/standalone/configuration/drools-users.properties
ADD etc/drools-roles.properties $JBOSS_HOME/standalone/configuration/drools-roles.properties

# Added files are chowned to root user, change it to the jboss one.
USER root
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/standalone-full-drools.xml && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/drools-users.properties && \
chown jboss:jboss $JBOSS_HOME/standalone/configuration/drools-roles.properties

########## Adding GIT post commit hooks to push to Git ########
ADD git-integration/post-commit $JBOSS_HOME/hooks/
ADD git-integration/git-push-2.1-SNAPSHOT.jar $JBOSS_HOME/hooks/

RUN chown -R jboss:jboss $JBOSS_HOME/hooks
RUN chmod -R 755 $JBOSS_HOME/hooks

# Install required tools
RUN yum -y install git && yum clean all

# Switchback to jboss user
USER jboss

####### RUNNING DROOLS-WB ############
WORKDIR $JBOSS_HOME/bin/
CMD ["./start_drools-wb.sh"]
