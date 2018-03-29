FROM centos:7

RUN yum install -y \
        ansible \
        mysql \
        MySQL-python

COPY hosts /etc/ansible/hosts

COPY config-database.yml /ansible/

COPY migrate.sql /ansible/

CMD ansible-playbook /ansible/config-database.yml
