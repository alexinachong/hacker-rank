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

# amendTheSentence
def amendTheSentence(s)
    cap_alpha = ("A".."Z").to_a
    low_alpha = ("a".."z").to_a

    result = ""

    s.each_char do |ch|
        if cap_alpha.include?(ch)
            alpha_idx = cap_alpha.index(ch)
            result << " #{low_alpha[alpha_idx]}"
        else
            result << ch
        end
    end

    result.strip
end

def centuryFromYear(year)
    century = year / 100

    if year % 100 == 0
        return century
    else
        return century + 1
    end
end

def checkPalindrome(inputString)
    inputString == inputString.reverse
end

def adjacentElementsProduct(inputArray)
    max = inputArray[0] * inputArray[1]

    i = 0
    while i < inputArray.length - 1
        if inputArray[i] * inputArray[i + 1] > max
            max = inputArray[i] * inputArray[i + 1]
        end
        i += 1
    end

    max
end
