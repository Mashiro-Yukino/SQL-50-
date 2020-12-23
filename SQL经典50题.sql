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


                                                              
#8.查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息#                                                              
select distinct student.* from student join sc
on student.sid = sc.sid where
cid in (select cid from sc where sid = '01')                                                              
                                                              
                                                              

#9.查询和" 01 "号的同学学习的课程完全相同的其他同学的信息#
select student.sid, any_value(student.sname), any_value(student.sage),
any_value(student.ssex) from student join sc
on student.sid = sc.sid where cid in
(select cid from sc where sid = '01')
group by sid having count(cid) = 
(select count(cid) from sc where sid = '01') and sid != '01'                                                              
                                                              
                                                              
                                                              
#11.查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩#
select student.sid, any_value(student.sname),
avg(score) as avgscore
from student join sc
on student.sid = sc.sid where score < 60 
group by student.sid
having count(cid) >= 2   
                                                              
                                                              
                                                              
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

                                                    
                                                              
#17. 统计各科成绩各分数段人数：课程编号，课程名称，[100-85]，[85-70]，[70-60]，[60-0] 及所占百分比# 
select sc.cid, any_value(course.cname),
sum(case when score >=85 and score < 100 then 1 else 0 end) as '[100-85]',
sum(case when score >=85 and score < 100 then 1 else 0 end)/count(sid) as 'rate[100-85]',
sum(case when score >=70 and score < 85 then 1 else 0 end) as '[85-70]',
sum(case when score >=70 and score < 85 then 1 else 0 end)/count(sid) as 'rate[85-70]',
sum(case when score >=60 and score < 70 then 1 else 0 end) as '[70-60]',
sum(case when score >=60 and score < 70 then 1 else 0 end)/count(sid) as 'rate[70-60]',
sum(case when score >=0 and score < 60 then 1 else 0 end) as '[60-0]',
sum(case when score >=0 and score < 60 then 1 else 0 end)/count(sid) as 'rate[60-0]'
from sc left join course on course.cid = sc.cid group by cid                                                              
                                                              

                                                              
#18.查询各科成绩前三名的记录#
select a.*, count(b.score) + 1 as ranking from sc a 
left join sc b on a.cid = b.cid and b.score > a.score
group by cid, sid, score having ranking < 4
order by cid, score desc
                                                              
                                                              
                                                              
                                                              
                                                              
#22. 查询名字中含有「风」字的学生信息#
select student.* from student
where student.sname like "%风%"                                                              
                                                              
                                                              
                                                              
#23查询同名同性学生名单，并统计同名人数#  
select sname, count(sid) from student
group by sname having count(sid) > 1                                                              
                                                              
                                                              

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

                                                              

#34.成绩有重复的情况下，查询选修「张三」老师所授课程的学生中，成绩最高的学生
信息及其成绩#   
select student.*, score from student left join
sc on student.sid = sc.sid
left join course on course.cid = sc.cid
left join teacher on teacher.tid = course.tid
where teacher.tname = '张三' and score in
(select max(score) from sc left join course on course.cid = sc.cid
left join teacher on teacher.tid = course.tid
where teacher.tname = '张三'
)
                                                              
                                                              

#35.查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩#
select distinct a.* from sc a join sc b
on a.sid = b.sid where a.score = b.score and a.cid != b.cid                                                              
                                                              
                                                                                                                            
                                                              
#36. 查询每门成绩最好的前两名#
select a.*, count(b.score) + 1 as ranking from sc a 
left join sc b on a.cid = b.cid and b.score > a.score
group by a.cid, a.sid, a.score having ranking <3
order by a.cid, ranking                                                               
                                                              
                                                              
 
#37. 统计每门课程的学生选修人数（超过 5 人的课程才统计）。#
select cid, count(sid) from sc
group by cid having count(sid) > 5
                                                              
                                                              

#38.检索至少选修两门课程的学生学号#
select sid, count(cid) from sc
group by sid having count(cid) > 1
                                                              
                                                              
                                                              
#39.查询选修了全部课程的学生信息#
select student.sid, any_value(sname), any_value(sage), any_value(ssex)
from student left join sc
on student.sid = sc.sid
group by sid having count(cid) = 3
                                                              
                                                              
                                                              
                                                              
#40.查询各学生的年龄，只按年份来算#
select sid,sname, sage, 
year(now()) - year(sage) as '年龄'
from student
                                                              
