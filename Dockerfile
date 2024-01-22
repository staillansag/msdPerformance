FROM staillansag/webmethods-microservicesruntime:10.15.7-msdemo

ARG GIT_TOKEN
ENV GIT_TOKEN=$GIT_TOKEN

EXPOSE 5555
EXPOSE 5543
EXPOSE 9999

USER sagadmin

RUN /opt/softwareag/wpm/bin/wpm.sh install -u staillansag -p $GIT_TOKEN -r https://github.com/staillansag -d /opt/softwareag/IntegrationServer msdPerformance

# Make authorizations compliant with OpenShift
USER root
RUN chgrp -R 0 /opt/softwareag/IntegrationServer/packages && chmod -R g=u /opt/softwareag/IntegrationServer/packages
USER sagadmin