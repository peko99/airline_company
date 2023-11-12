-- Query to find the oldest crew member
SELECT name
FROM Crew
ORDER BY date_of_birth
LIMIT 1;

-- Query to find the n-th oldest crew member, NOTE: replace n with the desired number
SELECT name
FROM Crew
ORDER BY date_of_birth
OFFSET n-1
LIMIT 1;

-- Query to find the most experienced crew member (can work on most aircrafts)
SELECT c.name
FROM Crew c
JOIN (
    SELECT crew_id, COUNT(*) AS experience_count
    FROM CrewAircraftExperience
    GROUP BY crew_id
    ORDER BY experience_count DESC
    LIMIT 1
) e ON c.crew_id = e.crew_id;

-- Query to find the least experienced crew member (can work on least aircrafts)
SELECT c.name
FROM Crew c
LEFT JOIN (
    SELECT crew_id, COUNT(*) AS experience_count
    FROM CrewAircraftExperience
    GROUP BY crew_id
) e ON c.crew_id = e.crew_id
ORDER BY e.experience_count NULLS FIRST
LIMIT 1;
