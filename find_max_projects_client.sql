WITH client_projects_count AS (
SELECT client.ID, client.NAME, COUNT(project.ID) AS project_count
FROM client
JOIN project ON client.ID = project.CLIENT_ID
GROUP BY client.ID
)
SELECT *
FROM client_projects_count
WHERE project_count = (SELECT MAX(project_count) FROM client_projects_count);
