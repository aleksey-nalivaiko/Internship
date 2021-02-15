# Replication MySql with Docker

## 1. Run docker images:
```
docker-compose up -d
```

## 2. Configuring master

```
docker exec -it master mysql -uroot -p \
  -e "INSTALL PLUGIN rpl_semi_sync_master SONAME 'semisync_master.so';" \
  -e "SET GLOBAL rpl_semi_sync_master_enabled = 1;" \
  -e "SET GLOBAL rpl_semi_sync_master_wait_for_slave_count = 1;" \
  -e "SHOW VARIABLES LIKE 'rpl_semi_sync%';"
```
Create replication user on master node
```
docker exec -it master mysql -uroot -p \
  -e "CREATE USER 'repl'@'%' IDENTIFIED BY 'slavepass';" \
  -e "GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';" \
```

## 3. Configuring slave
```
docker exec -it slave mysql -uroot -p \
    -e "CHANGE MASTER TO MASTER_HOST='master', MASTER_USER='repl', \
      MASTER_PASSWORD='slavepass', MASTER_LOG_FILE='mysql-bin-1.000004';"
```
You can see MASTER_LOG_FILE with command on master node:
```
docker exec -it master mysql -uroot -p \
  -e "SHOW MASTER STATUS;"
```
```
docker exec -it slave mysql -uroot -p -e "START SLAVE;"
```

## 4. Checking slave replication status:
```
docker exec -it slave1 mysql -uroot -p -e "SHOW SLAVE STATUS\G"
```

## 5. Create table and check on slave
```
$ docker exec -it master mysql -uroot -p -e "CREATE DATABASE Exadel; SHOW DATABASES;"
```
Output:
```console
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| Exadel             |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

```
  docker exec -it slave mysql -uroot -p \
  -e "SHOW VARIABLES WHERE Variable_name = 'hostname';" \
  -e "SHOW DATABASES;"
```
Output:
```console
mysql: [Warning] Using a password on the command line interface can be insecure.
+---------------+--------+
| Variable_name | Value  |
+---------------+--------+
| hostname      | slave  |
+---------------+--------+
+--------------------+
| Database           |
+--------------------+
| information_schema |
| Exadel             |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

