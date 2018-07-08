# Project List
# CREATE PROCEDURE projectList()
# BEGIN
# 	SELECT
#         project_name, team_lead, income
#     FROM
#         Projects
#     ORDER BY
#         internal_id ASC;
# END

# Countries Selection
# CREATE PROCEDURE countriesSelection()
# BEGIN
# 	SELECT
#         *
#     FROM
#         countries
#     WHERE
#         continent = 'Africa'
#     ORDER BY
#         name ASC;
# END

# Monthly Scholarships
# CREATE PROCEDURE monthlyScholarships()
# BEGIN
# 	SELECT
#         id, scholarship / 12 AS scholarship
#     FROM
#         scholarships;
# END

# Projects Team
# CREATE PROCEDURE projectsTeam()
# BEGIN
# 	SELECT DISTINCT name
#     FROM projectLog
#     ORDER BY name ASC;
# END

# Automatic Notifications
# CREATE PROCEDURE automaticNotifications()
#     SELECT email
#     FROM users
#     WHERE role NOT IN ("admin", "premium")
#     ORDER BY email;

# Volleyball Results
# CREATE PROCEDURE volleyballResults()
# BEGIN
#     SELECT
#         *
#     FROM
#         results
#     ORDER BY
#         wins ASC;
# END
