# Task MySql

## 1. Deploy a SQL database (MySQL or PostgreSQL) in a container:

## 2. Populate the database. Make two tables:
```
Students (ID; Student; StudentId);
Result (ID; StudentId; Task1; Task2; Task3; Task4);
```

## 3. Write a SQL script that will populate the database and check for existing tables / records.
```
File build.sql 
```

## 4. Write a request that by your last name will find information on completed tasks and display the result on the screen
```
select * from Result 
join Exadel.Students 
on Exadel.Result.StudentId = Exadel.Students.Id 
where Exadel.Students.LastName = 'Наливайко';
```

## 5. Configure SQL database replication (Master-> Slave)
```
Folder replication

```
## 6. Add var USERNAME
```
Add an environment variable ($USERNAME: 16) to the docker-compose.yml and run the request:

select * from Result 
join Exadel.Students 
on Exadel.Result.StudentId = Exadel.Students.Id 
where Exadel.Students.ID = ${USERNAME};

```
