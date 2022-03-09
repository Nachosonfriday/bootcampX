SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, completed_at - started_at AS duration
FROM students
JOIN assistance_requests ON assistance_requests.student_id = students.id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
JOIN assignments ON assistance_requests.assignment_id = assignments.id
GROUP BY students.name, teachers.name, assignments.name, completed_at - started_at
ORDER BY completed_at - started_at;