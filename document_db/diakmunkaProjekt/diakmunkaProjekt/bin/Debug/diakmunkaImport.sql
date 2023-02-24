DELETE FROM employers;
DELETE FROM projects;
DELETE FROM students;

INSERT INTO employers (id, name, settlement) VALUES
(1, 'Bicaj Futárszolgálat', 'Csepűfalva'),
(2, 'Soós Pékség', 'Szombati'),
(3, 'Pokol Vagyonvédelem', 'Komád'),
(4, 'Vass Kereskedés', 'Zombrád'),
(5, 'Kati Virágbolt', 'Komád'),
(6, 'Fekete Kávéház', 'Szombati'),
(7, 'Körúti Kávéház', 'Csepűfalva'),
(8, 'Királyi Cukrászat', 'Zombrád'),
(9, 'Konty Fodrászat', 'Szombati'),
(10, 'Falat Pékség', 'Komád'),
(11, 'Korr Vaskereskedés', 'Csepűfalva');

INSERT INTO students (id, name, datetime) VALUES
(1, 'Kos Péter', '1987.11.5 0:00:00'),
(2, 'Port Imre', '1990.5.5 0:00:00'),
(3, 'Kovács Imre', '1984.3.2 0:00:00'),
(4, 'Horváth Emil', '1988.5.2 0:00:00'),
(5, 'Kapos Petra', '1985.12.23 0:00:00'),
(6, 'Csóka Anna', '1981.11.30 0:00:00'),
(7, 'Nyúl Tamás', '1988.2.16 0:00:00'),
(8, 'Ordasi Emma', '1989.1.3 0:00:00'),
(9, 'Koppány Olga', '1984.2.28 0:00:00'),
(10, 'Kozma Patrícia', '1983.6.1 0:00:00');

INSERT INTO projects (employerid, studentid, job, date, hourlyrate, numberofhours, highschoolstudent) VALUES
(1, 1, 'kézbesítő', '2003.7.2 0:00:00', 400, 4, 0),
(1, 2, 'ügyfélszolgálati munkatárs', '2003.7.3 0:00:00', 300, 4, 0),
(2, 1, 'kisegítő', '2003.7.1 0:00:00', 500, 4, 1),
(2, 2, 'eladó', '2003.7.1 0:00:00', 350, 4, 0),
(1, 1, 'kézbesítő', '2003.7.3 0:00:00', 450, 6, 0),
(1, 2, 'futár', '2003.7.6 0:00:00', 300, 5, 1),
(2, Null, 'eladó', '2003.7.7 0:00:00', 400, 6, 0),
(9, Null, 'kisegítő', '2003.6.19 0:00:00', 300, 4, 0),
(9, 6, 'takarító', '2003.6.19 0:00:00', 400, 4, 0),
(9, 6, 'takarító', '2003.6.20 0:00:00', 400, 4, 0),
(9, 8, 'kisegítő', '2003.6.21 0:00:00', 300, 6, 1),
(9, 8, 'kisegítő', '2003.6.22 0:00:00', 300, 6, 1),
(9, 6, 'takarító', '2003.6.23 0:00:00', 400, 4, 0),
(6, 4, 'ruhatáros', '2003.9.11 0:00:00', 400, 4, 0),
(6, 7, 'ruhatáros', '2003.9.11 0:00:00', 400, 4, 0),
(6, 5, 'pincér', '2003.6.11 0:00:00', 450, 6, 0),
(6, 5, 'pincér', '2003.6.12 0:00:00', 450, 6, 0),
(8, 9, 'eladó', '2003.7.21 0:00:00', 500, 4, 0),
(8, 9, 'eladó', '2003.7.22 0:00:00', 500, 4, 0),
(8, 10, 'takarító', '2003.8.10 0:00:00', 350, 6, 1),
(8, 10, 'takarító', '2003.8.11 0:00:00', 350, 6, 1),
(11, 5, 'eladó', '2003.5.10 0:00:00', 400, 4, 0),
(11, 6, 'raktáros', '2003.5.20 0:00:00', 300, 4, 0),
(11, 5, 'eladó', '2003.6.23 0:00:00', 300, 6, 0),
(10, Null, 'takarító', '2003.7.29 0:00:00', 250, 4, 1),
(10, Null, 'takarító', '2003.7.30 0:00:00', 250, 4, 1),
(10, 3, 'takarító', '2003.7.31 0:00:00', 300, 4, 1),
(10, 3, 'takarító', '2003.8.1 0:00:00', 300, 4, 1),
(10, 8, 'eladó', '2003.9.12 0:00:00', 300, 6, 1),
(10, 8, 'eladó', '2003.9.13 0:00:00', 300, 6, 1),
(7, 8, 'ruhatáros', '2003.8.20 0:00:00', 200, 4, 1),
(7, 8, 'ruhatáros', '2003.8.21 0:00:00', 200, 4, 1),
(7, Null, 'ruhatáros', '2003.8.22 0:00:00', 200, 4, 1),
(7, Null, 'ruhatáros', '2003.8.23 0:00:00', 200, 4, 1),
(4, Null, 'raktáros', '2003.10.10 0:00:00', 300, 6, 0),
(4, Null, 'raktáros', '2003.10.11 0:00:00', 300, 6, 0),
(4, Null, 'raktáros', '2003.10.12 0:00:00', 300, 6, 0),
(5, 7, 'eladó', '2003.6.5 0:00:00', 400, 4, 0),
(5, 7, 'eladó', '2003.6.6 0:00:00', 400, 4, 0),
(5, 7, 'eladó', '2003.6.7 0:00:00', 400, 4, 0),
(11, Null, 'eladó', '2003.7.7 0:00:00', 400, 6, 0);

SELECT * FROM employers;
SELECT * FROM students;
SELECT * FROM projects;
