# Employee Work Hours Calculation – SQL Project

This project calculates the total work hours of employees based on their **check-in and check-out times** from attendance logs. It is developed as part of my remote internship in the **SQL Department** at **Celebal Technologies**.

---

## 📌 Features

- Identifies:
  - First Check-in Time
  - Last Check-out Time
  - Number of Times the Employee Left the Office (OUT count)
  - Total Work Hours (excluding OUT time)
- Uses:
  - SQL Common Table Expressions (CTEs)
  - Window Functions (`ROW_NUMBER`)
  - Time Duration Calculations
  - Clean `HH:MM` formatting of output

---

## 🗃️ Project Structure
employee-work-hours-sql/
│
├── data/
│ └── sample_data.sql -- SQL for table creation and data insertion
│
├── sql/
│ └── calculate_work_hours.sql -- Main SQL query logic
│
├── LICENSE -- Open-source license (MIT)
├── README.md -- Project documentation


---

## 📋 Input Schema

Table: `CheckInOutLog`

| Column     | Type        | Description               |
|------------|-------------|---------------------------|
| EmpID      | INT         | Employee ID               |
| Name       | VARCHAR     | Employee Name             |
| LogTime    | DATETIME    | Timestamp of the log      |
| Attendance | VARCHAR(10) | Either `IN` or `OUT`      |

---

## ✅ Sample Output

Below is the real output generated after running the final SQL logic:

This output includes:

- First check-in time
- Last check-out time
- Number of out events (breaks)
- Total work hours (calculated using SQL logic)

![Query Output](https://raw.githubusercontent.com/KaurGurbani/Employee-Check-In-Out-Problem/main/docs/query_output.png.png)


---

## 🚀 How to Run

1. Open SQL Server Management Studio (SSMS) or any SQL interface.
2. Run the script from `data/sample_data.sql` to create the table and insert data.
3. Run the logic in `sql/calculate_work_hours.sql` to generate the report.

---

## ⚙️ Technologies Used

- Microsoft SQL Server (T-SQL)
- Window Functions
- CTEs
- Time & Date Arithmetic

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).

---

## 🙋‍♂️ Author

**Gurbani Kaur**  
Intern – SQL Department  
Celebal Technologies  
LinkedIn Profile : https://www.linkedin.com/in/gurbani-kaur-saluja/


> If you find this helpful, please ⭐️ the repo!


