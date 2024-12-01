
--- Table: Users
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'instructor') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: Courses
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    instructor_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (instructor_id) REFERENCES Users(user_id) ON DELETE SET NULL
);

-- Table: Classes
CREATE TABLE Classes (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    name VARCHAR(255) NOT NULL,
    scheduled_at DATETIME NOT NULL,
    duration INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

-- Table: Attendance
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT,
    user_id INT,
    status ENUM('present', 'absent') NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Classes(class_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Insert Data into Users
INSERT INTO Users (name, email, password, role, created_at)
VALUES
    ('Muthu', 'krish31150183@gmail.com', 'abc@123', 'student', NOW()),
    ('Varun', 'abc@123@gmail.com', 'abe123', 'instructor', NOW());

-- Insert Data into Courses
INSERT INTO Courses (name, description, instructor_id, created_at)
VALUES
    ('MERN', 'To develop dynamic websites', 2, NOW()),
    ('Java', 'To develop apps', 2, NOW());

-- Insert Data into Classes
INSERT INTO Classes (course_id, name, scheduled_at, duration)
VALUES
    (1, 'HTML_DAY_1', '2024-10-10 09:00:00', 150),
    (1, 'HTML_DAY_2', '2024-10-11 09:00:00', 150);

-- Insert Data into Attendance
INSERT INTO Attendance (class_id, user_id, status)
VALUES
    (1, 1, 'present'),
    (1, 2, 'absent'),
    (2, 1, 'present');


select * from Users