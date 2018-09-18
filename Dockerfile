from jenkins/jenkins:2.121.2

# Distributed Builds plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves

# install Notifications and Publishing plugins
RUN /usr/local/bin/install-plugins.sh email-ext
RUN /usr/local/bin/install-plugins.sh mailer
RUN /usr/local/bin/install-plugins.sh slack

# UI
RUN /usr/local/bin/install-plugins.sh greenballs

# Scaling
RUN /usr/local/bin/install-plugins.sh kubernetes
