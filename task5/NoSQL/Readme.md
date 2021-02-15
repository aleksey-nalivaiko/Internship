# Replication MongoDB with Docker

## 1. Run mongo database:
```
docker-compose up -d
```

## 2. Exec into master and run Mongo console

```
docker exec -it master bash
mongo
```

## 3. Configure replica 
```
rs.initiate(
  {
    _id : 'rs0',
    members: [
      { _id : 0, host : "master:27017" },
      { _id : 1, host : "slave:27017" },
      { _id : 2, host : "arbiter:27017", arbiterOnly: true}
    ]
  }
)

## 4. Create table and check on slave
```
use Exadel

db.createCollection("Students")
```
Output on master:
```console
rs0:PRIMARY> show dbs
Exadel  0.000GB
admin   0.000GB
config  0.000GB
local   0.000GB
```

Output on slave:
```console
rs0:SECONDARY> show dbs
Exadel  0.000GB
admin   0.000GB
config  0.000GB
local   0.000GB
```

