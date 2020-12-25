CREATE TABLE `education` (
`日期` date NOT NULL,
`标题` varchar(100) NOT NULL,
`信息类别` varchar(100) NOT NULL,
`发文机构` varchar(100) NOT NULL,
`内容概述` varchar(100) NOT NULL)character set utf8;

insert into education values('2020/9/30' , ' 国务院学位委员会, 教育部关于印发《专业学位研究生教育发展方案（2020-2025）》的通知' , 
'高等教育','国务院学位委员会 教育部', '国务院学位委员会、教育部印发《专业学位研究生教育发展方案（2020-2025）》。');
insert into education values('2020/9/30' , ' 国务院学位委员会关于开展2020年博士硕士学位授权审核工作的通知' , 
'教育综合管理','国务院学位委员会', ' 国务院学位委员会发布《关于开展2020年博士硕士学位授权审核工作的通知》。'); 


                           




select count(信息类别) from education where 信息类别 = '高等教育'
select count(信息类别) from education where 信息类别 = '教育综合管理'
select count(信息类别) from education where 信息类别 = '发展规划'
select count(信息类别) from education where 信息类别 = '干部人事人才'
select count(信息类别) from education where 信息类别 = '职业教育与成人教育'
select count(信息类别) from education where 信息类别 = '其他'
select count(信息类别) from education where 信息类别 = '政务概况'
select count(信息类别) from education where 信息类别 = '国际合作与交流'
select count(信息类别) from education where 信息类别 = '科学研究'
select count(信息类别) from education where 信息类别 = '部门规章'
select count(信息类别) from education where 信息类别 = '(空白)'
select count(信息类别) from education where 信息类别 = '科学研究'


select count(发文机构) from education where 信息类别 = '部门联合'
select count(发文机构) from education where 信息类别 = '国务院学位委员会'
select count(发文机构) from education where 信息类别 = '其他'
select count(发文机构) from education where 信息类别 = '教育部'
select count(发文机构) from education where 信息类别 = '教育部办公厅'
select count(发文机构) from education where 信息类别 = '教育部学位管理与研究生教育司'
select count(发文机构) from education where 信息类别 = '教育部职业教育与成人教育司'
select count(发文机构) from education where 信息类别 = '中华人民共和国教育部 国务院学位委员会'
select count(发文机构) from education where 信息类别 = '教育部国际合作与交流司'
select count(发文机构) from education where 信息类别 = '教育部思想政治工作司'
select count(发文机构) from education where 信息类别 = '教育部思想政治工作司 教育部学位管理与研究生教育司'




select 日期, count(日期)
from education group by 日期 having
日期 like '1998%'

select 日期, count(日期)
from education group by 日期 having
日期 like '1999%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2000%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2001%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2002%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2003%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2004%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2005%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2006%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2007%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2008%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2009%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2010%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2011%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2012%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2013%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2014%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2010%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2015%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2016%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2017%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2018%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2019%'

select 日期, count(日期)
from education group by 日期 having
日期 like '2020%'






