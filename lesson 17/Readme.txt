FROM ubuntu:16.04
RUN apt update
RUN apt install -y lsb-release && apt-get clean all
RUN apt install -y wget
RUN apt install -y curl
RUN wget https://cdn.otus.ru/media/public/1e/69/backup_des.xbstream.gz-195395-1e696d.des3
RUN wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
RUN dpkg -i percona-release_latest.$(lsb_release -sc)_all.deb
RUN apt install -y percona-xtrabackup-80

RUN mkdir test
RUN openssl des3 -d -salt -k "password" -in backup_des.xbstream.gz-195395-1e696d.des3 | gunzip > test/backup.xbstream
RUN cd test
RUN xbstream -x < backup.xbstream

RUN apt install mysql-server-8.0
RUN cd ..
RUN rm -r /var/lib/mysql
RUN xtrabackup --prepare --target-dir=
RUN xtrabackup --copy-back --target-dir=
datadir /var/lib/mysql
RUN chown -R mysql:mysql /var/lib/mysql
RUN systemctl start mysql
