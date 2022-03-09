SELECT avg(total_duration) AS average_total_duration
FROM 
  (SELECT cohorts.name AS cohort, 
  sum(completed_at-started_at) AS total_duration
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
JOIN assistance_requests ON students.id = assistance_requests.student_id
GROUP BY cohorts.name
ORDER BY SUM(assistance_requests.completed_at - assistance_requests.started_at)
) AS total_duration;