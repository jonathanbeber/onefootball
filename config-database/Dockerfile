FROM centos:7

RUN yum install -y \
        ansible \
        MySQL-python

COPY hosts /etc/ansible/hosts

COPY config-database.yml /ansible/

CMD ansible-playbook /ansible/config-database.yml
