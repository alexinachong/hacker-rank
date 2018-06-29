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
