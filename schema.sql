-- Database Schema for Student Task Manager

-- 1. Users table (for authentication)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL
);

-- 2. Students table
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    gender VARCHAR(50),
    mobile_number VARCHAR(50),
    email VARCHAR(255),
    course_name VARCHAR(255),
    admission_date DATE
);

-- 3. Attendance table
CREATE TABLE IF NOT EXISTS attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    attendance_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);

-- 4. Tasks table
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    task_name VARCHAR(255) NOT NULL,
    task_description TEXT,
    maximum_marks INT NOT NULL
);

-- 5. Student Tasks table
CREATE TABLE IF NOT EXISTS student_tasks (
    student_task_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    task_id INT NOT NULL,
    obtained_marks INT DEFAULT 0,
    submission_date DATE,
    submission_status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id) ON DELETE CASCADE
);

-- Insert a default administrator user if they do not exist
INSERT INTO users (username, password, full_name)
VALUES ('admin', 'admin123', 'Administrator')
ON DUPLICATE KEY UPDATE username=username;
