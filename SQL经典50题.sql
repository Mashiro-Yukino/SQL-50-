 #SC(SId,CId,score) SId 学生编号,CId 课程编号,score#
create table Student(SId varchar(10),Sname varchar(10),Sage datetime,Ssex varchar(10));
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙⻛' , '1990-12-20' , '男');
insert into Student values('04' , '李云' , '1990-12-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '⼥');
insert into Student values('06' , '吴兰' , '1992-01-01' , '⼥');
insert into Student values('07' , '郑⽵' , '1989-01-01' , '⼥');
insert into Student values('09' , '张三' , '2017-12-20' , '⼥');
insert into Student values('10' , '李四' , '2017-12-25' , '⼥');
insert into Student values('11' , '李四' , '2012-06-06' , '⼥');
insert into Student values('12' , '赵六' , '2013-06-13' , '⼥');
insert into Student values('13' , '孙七' , '2014-06-01' , '⼥');



#科目表 Course#
create table Course(CId varchar(10),Cname nvarchar(10),TId varchar(10));
insert into Course values('01' , '语⽂' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');



#教师表 Teacher#
create table Teacher(TId varchar(10),Tname varchar(10));
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');


#成绩表 SC#
create table SC(SId varchar(10),CId varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);



#12.检索" 01 "课程分数小于 60，按分数降序排列的学生信息#

SELECT * FROM Student JOIN SC ON Student.SId=SC.SId
WHERE CId = 01 AND score < 60
ORDER BY score DESC



#14.查询各科成绩最高分、最低分和平均分：
以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，
优良率，优秀率
及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
要求输出课程号和选修人数，查询结果按人数降序排列列，若人数相同，按课程号升序
排列#

select cid,count(sid), max(score), min(score), avg(score),
sum(pass)/count(sid) as passrate, sum(middle)/count(sid) as middlerate,
sum(good)/count(sid) as goodrate, sum(great)/count(sid) as greatrate
from (select *, 
case when score >=60 then 1 else 0 end as pass,
case when score >=70 and score <80 then 1 else 0 end as middle,
case when score >=80 and score <90 then 1 else 0 end as good,
case when score >=90 and score <100 then 1 else 0 end as great
from sc)a group by cid order by count(sid) desc, cid



#15.按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺#

select sid, cid, score, 
dense_rank()over (partition by cid
order by score desc) as ranking from sc 


#16.查询学生的总成绩，并进行排名，总分重复时保留名次空缺#

select sid, sum(score),
rank()over (order by sum(score) desc) as ranking
from sc group by sid


#24.查询 1990 年年出生的学生名单#

select student.* from student
where sage like '1990%'


#33.成绩不重复，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩#

select student.*, score from sc
left join student on sc.sid = student.sid
left join course on sc.cid = course.cid
left join teacher on teacher.tid = course.tid
where teacher.tname = '张三' 
order by score desc limit 1


