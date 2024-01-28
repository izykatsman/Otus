C:\Users\Maksimov-G\Desktop\otus\otus-mysql-docker> docker-compose up otusdb
[+] Running 13/13
 - otusdb Pulled                                                                                                                                                                                                                     29.9s
   - 27833a3ba0a5 Pull complete                                                                                                                                                                                                       4.7s
   - 864c283b3c4b Pull complete                                                                                                                                                                                                       4.8s
   - cea281b2278b Pull complete                                                                                                                                                                                                       5.0s
   - 8f856c14f5af Pull complete                                                                                                                                                                                                       5.1s
   - 9c4f38c23b6f Pull complete                                                                                                                                                                                                       5.2s
   - 1b810e1751b3 Pull complete                                                                                                                                                                                                       5.9s
   - 5479aaef3d30 Pull complete                                                                                                                                                                                                       5.9s
   - ded8fa2e1614 Pull complete                                                                                                                                                                                                       6.0s
   - 636033ba4d2e Pull complete                                                                                                                                                                                                      15.2s
   - 902e6010661d Pull complete                                                                                                                                                                                                      15.3s
   - dbe44d2bf055 Pull complete                                                                                                                                                                                                      15.3s
   - e906385f419d Pull complete                                                                                                                                                                                                      15.4s
[+] Running 3/3
 - Network otus-mysql-docker_default     Created                                                                                                                                                                                      0.1s
 - Volume "otus-mysql-docker_data"       Created                                                                                                                                                                                      0.0s
 - Container otus-mysql-docker-otusdb-1  Created                                                                                                                                                                                     10.7s
Attaching to otus-mysql-docker-otusdb-1
otus-mysql-docker-otusdb-1  | Initializing database
otus-mysql-docker-otusdb-1  | mysqld: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.

otus-mysql-docker-otusdb-1  | 2024-01-10T09:49:56.172361Z 0 [Warning] [MY-011070] [Server] 'Disabling symbolic links using --skip-symbolic-links (or equivalent) is the default. Consider not using this option as it' is deprecated and will be removed in a future release.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:49:56.172411Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.15) initializing of server in progress as process 31
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:24.260941Z 5 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:28.803258Z 0 [System] [MY-013170] [Server] /usr/sbin/mysqld (mysqld 8.0.15) initializing of server has completed
otus-mysql-docker-otusdb-1  | Database initialized
otus-mysql-docker-otusdb-1  | mysqld: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.
otus-mysql-docker-otusdb-1  | MySQL init process in progress...
otus-mysql-docker-otusdb-1  | MySQL init process in progress...
otus-mysql-docker-otusdb-1  | mbind: Operation not permitted
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:31.673286Z 0 [Warning] [MY-011070] [Server] 'Disabling symbolic links using --skip-symbolic-links (or equivalent) is the default. Consider not using this option as it' is deprecated and will be removed in a future release.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:31.673367Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 8.0.15) starting as process 82
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:32.491145Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:32.498171Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:32.525975Z 6 [ERROR] [MY-000061] [Server] 1007  Can't create database 'otus'; database exists.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:32.527004Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '8.0.15'  socket: '/var/run/mysqld/mysqld.sock'  port: 0  MySQL Community Server - GPL.
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:32.590830Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Socket: '/var/run/mysqld/mysqlx.sock'
otus-mysql-docker-otusdb-1  | mysql: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.
otus-mysql-docker-otusdb-1  | Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
otus-mysql-docker-otusdb-1  | Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
otus-mysql-docker-otusdb-1  | Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
otus-mysql-docker-otusdb-1  | Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.
otus-mysql-docker-otusdb-1  | mysql: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.
otus-mysql-docker-otusdb-1  |
otus-mysql-docker-otusdb-1  | 2024-01-10T09:50:38.134313Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.15)  MySQL Community Server - GPL.
otus-mysql-docker-otusdb-1  |
otus-mysql-docker-otusdb-1  | MySQL init process done. Ready for start up.

PS C:\Users\Maksimov-G\Desktop\otus\otus-mysql-docker> docker-compose exec otusdb mysql -u root -p12345 otus
mysql: [Warning] World-writable config file '/etc/mysql/conf.d/my.cnf' is ignored.
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.15 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| otus               |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> use otus;
Database changed
mysql> show tables;
Empty set (0.00 sec)