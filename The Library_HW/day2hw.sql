Find the Average, Maximum, and Minimum marks obtained in the Day 1 Exam to see how the class performed as a whole.
 select
 round (avg (total_score),2) as average_marks,
 max (total_score) as max_marks,
 min (total_score) as min_marks
 from
 day_1_exam

 List the names of MBA students who scored above 35 on Day 2.
 select
 t1.full_name,
 t2.total_score
 from
 "RSVP_New" as t1
 join
 day_2_exam as t2
 on t1.hall_ticket_no = t2.hall_ticket_no
 where
 total_score > 35

Identify students whose Day 2 score was strictly higher than their Day 1 score.
 select
 t1.full_name,
 t2.total_score as day_1,
 t3.total_score as day_2
 from
 "RSVP_New" as t1
 join
 day_1_exam as t2
on t1.hall_ticket_no = t2.hall_ticket_no
join
day_2_exam as t3
on t1.hall_ticket_no = t3.hall_ticket_no
where t3.total_score > t2.total_score

Do passing students work faster? Join day_2_exam with qaday2 to find the average 'Total Time' for students who 'Pass' vs those who 'Fail'.
select
distinct t1.result_status,
avg(t2."Total Time") as avg_total_time
from
day_2_exam as t1
join
qaday2 as t2
on t1.hall_ticket_no = t2.hall_ticket_no
group by 1
order by avg_total_time desc

Which students have NULLs in Q1 or Q2 but still passed the Day 2 exam? (This helps identify students who skip but are still accurate).
select
distinct t1.result_status,
t2."Q1",
t2."Q2"
from
day_2_exam as t1
join
qaday2 as t2
on t1.hall_ticket_no = t2.hall_ticket_no
where
t1.result_status = 'Pass' and t2."Q1" isnull or t2."Q2" isnull

For each department, show the total number of registrations, total students who took Day 1, and total students who took Day 2.
select
t1.department_name,
count(t1.department_name) as registration,
count(t2.hall_ticket_no) as attended_day1,
count(t3.hall_ticket_no) as attended_day2
from
"RSVP_New" as t1
left join
day_1_exam as t2
on t1.hall_ticket_no = t2.hall_ticket_no
left join
day_2_exam as t3
on t1.hall_ticket_no = t3.hall_ticket_no
group by 1
order by registration desc

Using the dob (Date of Birth) in RSVP_New, identify students born before the year 2000 as 'Senior Students' and those born in 2000 or later as 'Junior Students'.
select
full_name,
dob,
 case
 when dob < '2000-01-01' then 'Senior Students'
 else 'Junior Students'
 end as age_group
 from
"RSVP_New"

Join day_2_exam with qaday2. Create a logic: If 'Total Time' is less than 1000 and 'Result' is 'Pass', label them as 'High Efficiency'. If they passed but took longer, label them as 'Hard Worker'.
select
t1.hall_ticket_no,
t1.result_status,
t2."Total Time",
 case
 when t2."Total Time" < 1000 and t1.result_status = 'Pass' then 'High Efficiency'
 when t1.result_status = 'Pass' then 'Hard Worker'
 else 'Failed'
 end as efficiency_rank
from
day_2_exam as t1
join
qaday2 as t2
on t1.hall_ticket_no = t2.hall_ticket_no

If a student finished Question 1 (Q1) in under 15 seconds, they are 'Quick to Fall in Love.' If they took over 60 seconds, they are 'Hard to Get.' If they skipped (NULL), they are 'Focusing on their Career'.
select
hall_ticket_no,
"Q1",
case
when "Q1" < 15 then 'Quick to Fall in Love.'
when "Q1" > 60 then 'Hard to Get.'
when "Q1" isnull then 'Focusing on their Career'
else 'Waiting for the right one.'
end as love_logic
from
qaday2

Get the full details from RSVP_New for the student who got the absolute maximum score on Day 2.(use subquery)
select
*
from
"RSVP_New" as t1
join
day_2_exam as t2
on t1.hall_ticket_no = t2.hall_ticket_no
where t2.total_score = (select max(total_score) from day_2_exam);

Who registered for the class before 'AMENAH AHSAN'?(use subquery)
select hall_ticket_no, full_name, created_at
from "RSVP_New"
where created_at < (
select created_at
from "RSVP_New"
where full_name = 'AMENAH AHSAN')

Show the details of students who are among the 5 fastest finishers of the Day 2 exam.
select 
    t1.hall_ticket_no,
    t1.surname,
    t1.full_name,
    t1.contact_no,
    t1.email,
    t1.college_name,
    t1.department_name,
    t1.dob,
    t1.created_at
from "RSVP_New" as t1
join day_2_exam as t2
    on t1.hall_ticket_no = t2.hall_ticket_no
    order by time_spent_sec asc
limit 5;

