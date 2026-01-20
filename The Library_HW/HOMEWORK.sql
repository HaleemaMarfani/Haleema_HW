Q1: Count how many students passed the exam.
select
distinct result_status,
count (result_status)
from
day_2_exam
where
result_status = 'Pass'
group by 1

Q2: Find the average score of all students who failed.
select
distinct result_status,
Round (avg (total_score),2) as Average_Score
from
day_2_exam
where
result_status = 'Fail'
group by 1

Q3: Get the highest score among all students.
select
max(total_score) as highest_score
from 
day_2_exam

Q4: Get the lowest score among passed students.
select
min(total_score) as lowest_score
from 
day_2_exam

Q5: Sum the total marks of all students who scored above 40.
select
sum(total_score) as total_marks
from 
day_2_exam
where
total_score > 40

Q6: Count students by result status for those who scored 35 or more.
select
distinct result_status,
count (result_status) as scored_above_35
from
day_2_exam
where
total_score > 35
group by 1

Q7: Find average score grouped by result status for students with scores between 30 and 40..
select
distinct result_status,
Round (avg (total_score),2) as Average_Score
from
day_2_exam
where
total_score between 30 and 40
group by 1

Q8: Get maximum and minimum scores grouped by result status for students who scored less than 35.
select
distinct result_status,
max(total_score) as highest,
min(total_score) as lowest
from 
day_1_exam
where
total_score < 35
group by 1

Q9: Count students grouped by result status for those whose names start with 'A'.
select
distinct result_status,
count (result_status) as students_name_with_A
from 
day_1_exam
where
student_name
like 'A%'
group by 1
  
Q10: Sum total scores grouped by result status for students who scored exactly 35, 40, or 45.
select
distinct result_status,
sum(total_score) as total_marks
from 
day_2_exam
where
total_score in (35, 40, 45)
group by 1

Q11: Count students by each score value, ordered by score descending.
select
total_score,
count (*)
from
day_2_exam
group by total_score
order by total_score desc

Q12: Show average score for each result status, ordered by average score.
select
distinct result_status,
round (avg (total_score),2) as average_score
from
day_2_exam
group by 1
order by average_score desc

Q13: Count how many students got each score, only for scores above 30, ordered by frequency.
select
total_score,
count (*) as frequency
from
day_2_exam
where
total_score > 30
group by total_score
order by frequency desc

Q14: Get total marks sum for each result status, ordered by sum.
select
distinct result_status,
SUM(total_score) as sum
from
day_2_exam
group by 1
order by sum

Q15: Find minimum score for each result status, ordered by min score.
select
distinct result_status,
min(total_score) as min_score
from
day_2_exam
group by 1
order by min_score

Q16: For passed students only, show count, average, max and min scores grouped by whether score is above 40.
select
distinct result_status,
count (total_score) as frequency,
round (avg (total_score),2) as average_score,
max(total_score) as max_score,
min(total_score) as min_score
from
day_2_exam
where
total_score > 40
group by 1

Q17: Count and average score for each result status, only for scores not equal to 35.
select
distinct result_status,
count (total_score) as frequency,
round (avg (total_score),2) as average_score
from
day_2_exam
where
total_score != 35
group by 1

Q18: Group students by score ranges (0-20, 21-30, 31-40, 41-50) and show count for each range.
select
total_score,
count (total_score) as frequency
from 
day_2_exam
where
total_score in (0-20, 21-30, 31-40, 41-50)
group by total_score
order by frequency desc

Q19: For each result status, show count of students with scores greater than 30 and less than 40.
select
distinct result_status,
count (total_score) as frequency
from
day_2_exam
where
total_score > 30 and total_score < 40
group by 1

Q20: Group by first letter of student name and show count and average score for each letter.
select
distinct result_status,
count (result_status) as students_name_with_A,
avg (total_score)
from 
day_1_exam
where
student_name
like 'A%' or
student_name
like 'B%'
group by 1
