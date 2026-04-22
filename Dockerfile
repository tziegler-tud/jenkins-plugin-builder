FROM jenkins/jenkins:2.555.1-lts

# Plugins-Definition ins Image kopieren
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

# Jenkins liefert install-plugins.sh bereits mit
RUN jenkins-plugin-cli \
    --plugin-file /usr/share/jenkins/ref/plugins.txt
