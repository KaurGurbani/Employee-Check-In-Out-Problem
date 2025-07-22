-- STEP 1: Numbering each row per employee to prepare IN–OUT pairs
WITH OrderedLogs AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY EmpID ORDER BY LogTime) AS rn
    FROM CheckInOutLog
),

-- STEP 2: Pairing IN with immediate next OUT using row numbers
PairedLogs AS (
    SELECT 
        l1.EmpID,
        l1.Name,
        l1.LogTime AS InTime,
        l2.LogTime AS OutTime
    FROM OrderedLogs l1
    JOIN OrderedLogs l2 
        ON l1.EmpID = l2.EmpID 
       AND l1.rn + 1 = l2.rn
    WHERE l1.Attendance = 'IN' AND l2.Attendance = 'OUT'
),

-- STEP 3: Calculating first IN, last OUT, total breaks, total duration
WorkSummary AS (
    SELECT 
        EmpID,
        MIN(InTime) AS FirstCheckInTime,
        MAX(OutTime) AS LastCheckOutTime,
        COUNT(*) AS TotalOutCount,
        SUM(DATEDIFF(SECOND, InTime, OutTime)) AS TotalWorkSeconds
    FROM PairedLogs
    GROUP BY EmpID
)

-- STEP 4: Final output with proper formatting
SELECT 
    w.EmpID,
    c.Name,
    CONVERT(VARCHAR, w.FirstCheckInTime, 120) AS FirstCheckInTime,
    CONVERT(VARCHAR, w.LastCheckOutTime, 120) AS LastCheckOutTime,
    w.TotalOutCount,
    -- Convert seconds to HH:MM format
    RIGHT('0' + CAST(w.TotalWorkSeconds / 3600 AS VARCHAR), 2) + ':' +
    RIGHT('0' + CAST((w.TotalWorkSeconds % 3600) / 60 AS VARCHAR), 2) AS TotalWorkHours
FROM WorkSummary w
JOIN (SELECT DISTINCT EmpID, Name FROM CheckInOutLog) c 
    ON w.EmpID = c.EmpID
ORDER BY w.EmpID;
