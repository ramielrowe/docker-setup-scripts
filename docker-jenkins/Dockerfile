FROM jenkins

USER root
RUN apt-get update && apt-get install git python python-dev python-pip wget zip libpq-dev libffi-dev -y
RUN wget -q -O /bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.10.0
RUN chmod 755 /bin/docker
RUN pip install virtualenv

USER jenkins
