WITH project_durations AS (
SELECT project.ID, project.CLIENT_ID, project.START_DATE, project.FINISH_DATE,
EXTRACT(YEAR FROM AGE(project.FINISH_DATE, project.START_DATE)) * 12 +
EXTRACT(MONTH FROM AGE(project.FINISH_DATE, project.START_DATE)) AS duration_in_months
FROM project
)
SELECT *
FROM project_durations
WHERE duration_in_months = (SELECT MAX(duration_in_months) FROM project_durations);
