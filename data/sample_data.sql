-- Drop if already exists
DROP TABLE IF EXISTS CheckInOutLog;

-- Create input table
CREATE TABLE CheckInOutLog (
    EmpID INT,
    Name VARCHAR(50),
    LogTime DATETIME,
    Attendance VARCHAR(10) -- Values: 'IN' or 'OUT'
);

-- Insert sample log data
INSERT INTO CheckInOutLog (EmpID, Name, LogTime, Attendance) VALUES
(1, 'Him', '2024-01-03 10:08', 'IN'),
(2, 'Raj', '2024-01-03 10:10', 'IN'),
(3, 'Anu', '2024-01-03 10:12', 'IN'),
(1, 'Him', '2024-01-03 11:11', 'OUT'),
(2, 'Raj', '2024-01-03 12:12', 'OUT'),
(3, 'Anu', '2024-01-03 12:35', 'OUT'),
(1, 'Him', '2024-01-03 12:08', 'IN'),
(2, 'Raj', '2024-01-03 12:25', 'IN'),
(3, 'Anu', '2024-01-03 12:40', 'IN'),
(1, 'Him', '2024-01-03 14:12', 'OUT'),
(2, 'Raj', '2024-01-03 15:12', 'OUT'),
(3, 'Anu', '2024-01-03 18:35', 'OUT'),
(1, 'Him', '2024-01-03 15:08', 'IN'),
(1, 'Him', '2024-01-03 18:08', 'OUT');
