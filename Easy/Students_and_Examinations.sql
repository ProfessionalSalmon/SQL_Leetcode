WITH count_exam AS (
    SELECT
        student_id,
        subject_name,
        COUNT(subject_name) AS attended_exams
    FROM
        Examinations
    GROUP BY
        student_id,
        subject_name
)
SELECT
    st.student_id,
    st.student_name,
    s.subject_name,
    COALESCE(attended_exams, 0) AS attended_exams
FROM
    Students st
    CROSS JOIN Subjects s
    LEFT JOIN count_exam c ON (
        st.student_id = c.student_id
        AND s.subject_name = c.subject_name
    )
ORDER BY
    student_id,
    subject_name;