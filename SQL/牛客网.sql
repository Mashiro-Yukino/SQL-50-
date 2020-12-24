CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
             

             
https://www.nowcoder.com/practice/ec1ca44c62c14ceb990c3c40def1ec6c?tpId=82&&tqId=29754&rp=1&ru=/ta/sql&qru=/ta/sql/question-ranking             
#1.查找入职员工时间排名倒数第三的员工所有信息，为了减轻入门难度，目前所有的数据里员工入职的日期都不是同一天#  
             
SELECT * FROM employees
ORDER BY hire_date DESC
LIMIT 1 offset 2

#当limit和offset组合使用的时候，limit后面只能有一个参数，
#表示要取的的数量,offset表示要跳过的数量 。      
             
             
        
             
https://www.nowcoder.com/practice/c63c5b54d86e4c6d880e4834bfd70c3b?tpId=82&tags=&title=&diffculty=0&judgeStatus=0&rp=1             
2.查找各个部门当前(dept_manager.to_date='9999-01-01')领导当前(salaries.to_date='9999-01-01')薪水详情以及其对应部门编号dept_no
(注:输出结果以salaries.emp_no升序排序，并且请注意输出结果里面dept_no列是最后一列)
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL, -- '员工编号',
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));
CREATE TABLE `dept_manager` (
`dept_no` char(4) NOT NULL, -- '部门编号'
`emp_no` int(11) NOT NULL, --  '员工编号'
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));             
             
             
select salaries.*, dept_manager.dept_no
from salaries join dept_manager
on salaries.emp_no = dept_manager.emp_no
where salaries.to_date='9999-01-01' 
and dept_manager.to_date='9999-01-01'
             
             
             

             
https://www.nowcoder.com/practice/23142e7a23e4480781a3b978b5e0f33a?tpId=82&tqId=29757&rp=1&ru=%2Fta%2Fsql&qru=%2Fta%2Fsql%2Fquestion-ranking
3.查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序(请注意，一个员工可能有多次涨薪的情况)
CREATE TABLE `employees` (
`emp_no` int(11) NOT NULL,
`birth_date` date NOT NULL,
`first_name` varchar(14) NOT NULL,
`last_name` varchar(16) NOT NULL,
`gender` char(1) NOT NULL,
`hire_date` date NOT NULL,
PRIMARY KEY (`emp_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

 
             
select employees.emp_no, salaries.salary 
from employees left join salaries 
on employees.emp_no = salaries.emp_no
where employees.hire_date = salaries.from_date
order by emp_no desc 
             
             
             
             
https://www.nowcoder.com/practice/4a052e3e1df5435880d4353eb18a91c6?tpId=82&tags=&title=&diffculty=0&judgeStatus=0&rp=1 
4.获取所有部门中当前(dept_emp.to_date = '9999-01-01')员工当前(salaries.to_date='9999-01-01')薪水最高的相关信息，
给出dept_no, emp_no以及其对应的salary，按照部门编号升序排列。
CREATE TABLE `dept_emp` (
`emp_no` int(11) NOT NULL,
`dept_no` char(4) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`dept_no`));
CREATE TABLE `salaries` (
`emp_no` int(11) NOT NULL,
`salary` int(11) NOT NULL,
`from_date` date NOT NULL,
`to_date` date NOT NULL,
PRIMARY KEY (`emp_no`,`from_date`));

             
             
SELECT d1.dept_no, d1.emp_no, s1.salary
FROM dept_emp as d1 INNER JOIN salaries as s1
ON d1.emp_no=s1.emp_no AND d1.to_date='9999-01-01'
AND s1.to_date='9999-01-01'
WHERE s1.salary in (SELECT MAX(s2.salary)
FROM dept_emp as d2 INNER JOIN salaries as s2
ON d2.emp_no=s2.emp_no AND d2.to_date='9999-01-01'
AND s2.to_date='9999-01-01' AND d2.dept_no = d1.dept_no
) ORDER BY d1.dept_no;             
             
             
             
             
https://www.nowcoder.com/practice/c59b452f420c47f48d9c86d69efdff20?tpId=82&tags=&title=&diffculty=0&judgeStatus=0&rp=1             
5.从titles表获取按照title进行分组，每组个数大于等于2，给出title以及对应的数目t。
注意对于重复的emp_no进行忽略(即emp_no重复的title不计算，title对应的数目t不增加)。
CREATE TABLE IF NOT EXISTS `titles` (
`emp_no` int(11) NOT NULL,
`title` varchar(50) NOT NULL,
`from_date` date NOT NULL,
`to_date` date DEFAULT NULL);
             
             
SELECT title, COUNT(DISTINCT emp_no) t
FROM titles
GROUP BY title
HAVING t>=2;             
             
