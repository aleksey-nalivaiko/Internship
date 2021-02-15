CREATE DATABASE IF NOT EXISTS Exadel;
USE Exadel;

CREATE TABLE Students (
  Id INT AUTO_INCREMENT NOT NULL ,
  LastName nvarchar(128) NOT NULL,
  FirstName nvarchar(128) NOT NULL,
  MidleName nvarchar(128) NOT NULL,
  PRIMARY KEY (Id)
);
INSERT INTO Students (LastName, FirstName, MidleName) VALUES
('Ражабов', 'Дамир', 'Шарофович'),
('Сивожелезов', 'Сергей', 'Владимирович'),
('Чеснюк', 'Дмитрий', 'Александрович'),
('Мацкевич', 'Андрей', 'Анатольевич'),
('Шеронов', 'Иван', 'Петрович'),
('Гавриш', 'Олег', 'Николаевич'),
('Демьянков', 'Владислав', 'Витальевич'),
('Пехоцкий', 'Юрий', 'Васильевич'),
('Шерстюк', 'Вадим', 'Александрович'),
('Казимиров', 'Сергей', 'Анатольевич'),
('Назаров', 'Павел', 'Андреевич'),
('Шатров', 'Игорь', 'Олегович'),
('Никольский', 'Валерий', 'Александрович'),
('Гурин', 'Сергей', 'Владимирович'),
('Кузин', 'Дмитрий', 'Алексеевич'),
('Наливайко', 'Алексей', 'Викторович'),
('Чех', 'Александр', 'Борисович'),
('Есьман', 'Михаил', 'Михайлович');

CREATE TABLE Result (
  Id INT AUTO_INCREMENT NOT NULL,
  StudentId int NOT NULL,
  Task1 nvarchar(128) DEFAULT NULL,
  Task2 nvarchar(128) DEFAULT NULL,
  Task3 nvarchar(128) DEFAULT NULL,
  Task4 nvarchar(128) DEFAULT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (StudentId) REFERENCES Students (Id)
);
INSERT INTO Result (StudentId, Task1, Task2, Task3, Task4) VALUES
(1, 'pass', 'pass', 'pass', 'pass'),
(2, 'pass', 'pass', 'pass', ''),
(3, 'pass', 'pass', 'pass', 'pass'),
(4, 'pass', 'pass', 'not passed', ''),
(5, 'pass', 'pass', 'not passed', ''),
(6, 'pass', 'pass', 'not passed', ''),
(7, 'pass', 'not passed', 'not passed', ''),
(8, 'pass', 'pass', 'pass', 'pass'),
(9, 'pass', 'not passed', 'not passed', ''),
(10, 'pass', 'pass', 'pass', 'pass'),
(11, 'pass', 'pass', 'pass', 'pass'),
(12, 'pass', 'pass', 'pass', 'pass'),
(13, 'pass', 'not passed', 'not passed', ''),
(14, 'pass', 'pass', 'pass', 'pass'),
(15, 'pass', 'not passed', 'not passed', ''),
(16, 'pass', 'pass', 'pass', ''),
(17, 'pass', 'pass', 'pass', ''),
(18, 'pass', 'pass', 'pass', 'pass');