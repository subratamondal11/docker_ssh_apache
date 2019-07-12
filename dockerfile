from ubuntu:14.04

maintainer Subrata Mondal <subratamondal11@gmail.com>

# install ssh and apache
RUN apt-get update && apt-get install -y openssh-server && apt-get install -y apache2
RUN mkdir /var/run/sshd

# create user
RUN useradd -m -s /bin/bash user1 && echo 'user1:$6$3OEPIHs8XvUe0ajD$XP2Zp24IOGDOvEDMcJo5dYkS3CmD2F6NINXb3jEgaOeaSdNv1HWBVTjqmHcuKKRvUywdvRdkzwUUrNYhFczV./' | chpasswd -e

# provide sudo access
RUN echo "user1 ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

COPY timecounter.sh /usr/local/bin/timecounter.sh
RUN chmod +x /usr/local/bin/timecounter.sh

EXPOSE 22 80
CMD ["/usr/local/bin/timecounter.sh"]
