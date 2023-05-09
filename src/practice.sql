use quanlysinhvien;

select Address, count(Address) as student_number
from student
group by Address;

select student.StudentID, student.StudentName, avg(mark.Mark)
from student
left join mark on student.StudentID = mark.StudentID
group by student.StudentID;

select student.StudentID, student.StudentName, avg(mark.Mark)
from student
         left join mark on student.StudentID = mark.StudentID
group by student.StudentID
having avg(mark.Mark > 15);

select studentid, student.studentname, address, phone, status, classid, avg_mark
from student
join (select student.StudentID as newStudentID, student.StudentName, avg(mark.Mark) as avg_mark
      from student
               left join mark on student.StudentID = mark.StudentID
      group by student.StudentID) as avg_mark on student.StudentID = newStudentID
where avg_mark = (
    select max(avg_mark)
    from (
             select avg(mark.Mark) as avg_mark
             from student
                      left join mark on student.StudentID = mark.StudentID
             group by student.StudentID
         ) as avg_point
    );

select studentid, student.studentname, address, phone, status, classid, avg(mark.Mark)
from student join mark using (StudentID)
group by student.StudentID
having avg(mark.Mark) >= all (
    select avg(mark.Mark)
    from mark
    group by StudentID
);

SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M using (StudentID)
GROUP BY S.StudentId
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId