FROM jenkins/jenkins:2.336

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

ENV JENKINS_USER jenkins
ENV JENKINS_PASS jenkins

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

RUN curl -vsSfL https://github.com/CheckmarxDev/checkmarx-ast-scanner-plugin/releases/latest/download/checkmarx-ast-scanner.hpi -o /usr/share/jenkins/ref/plugins/checkmarx-ast-scanner.hpi
