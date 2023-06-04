select * from employers;
select DISTINCT * from projects;
select * from students;
select * from users;

SELECT e.name ename, e.settlement, p.job, p.date, p.hourlyrate, p.numberofhours, s.name sname FROM students s
  INNER JOIN projects p on s.id = p.studentid
  INNER JOIN employers e on p.employerid = e.id;

SELECT DISTINCT * FROM students s
  INNER JOIN projects p on s.id = p.studentid
  INNER JOIN employers e on p.employerid = e.id;

#DATE_FORMAT(s.datetime, '%Y.%m.%e %H:%i:%s') datetime