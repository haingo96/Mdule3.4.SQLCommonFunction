use quanlysinhvien;

select *
from subject
where Credit = (select max(Credit) from subject);

select *
from subject
where Credit >= all (select Credit from subject);

select subject.SubID, subject.SubName, mark.Mark
from subject
join mark using (SubID)
where Mark >= all (select Mark from mark);

select student.StudentID, student.StudentName, avg(mark.Mark)
from student
left join mark using (StudentID)
group by student.StudentID
order by StudentID desc;