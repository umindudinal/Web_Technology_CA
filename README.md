# 🎓 ITUM Student Event Management System

> A full-stack web application built as a Web Technology Continuous Assessment (CA) for ITUM, enabling students to browse and register for campus events while admins manage events and users through a role-based dashboard.

![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

---

## 📖 About

The **ITUM Student Event Management System** is a web-based platform for ITUM students and staff. Students can register, log in with their Registration Number, browse upcoming events, and register for events using an event code. Admins have access to a full dashboard where they can manage events (including image uploads), manage users, and view all registrations. The footer credits the system as developed by **Umindu Dinal**.

---

## ✨ Features

### 👨‍🎓 Student Features
- 🏠 **Home Page** — Latest 3 upcoming events with title, date, venue, event code, and image
- 📋 **Event Page** — Full events listing with event registration by event code
- ℹ️ **About Us** — Information about the system
- 📬 **Contact Us** — Contact page
- 🔐 **Login / Register** — Session-based login using Registration Number and password
- 👤 **Profile Page** — View personal account details
- ✅ **Event Registration** — Register for events using event code (duplicate registration check)

### 🛠️ Admin Features
- 📊 **Admin Dashboard** — Role-based welcome dashboard
- 📅 **Event Management** — Add (with image upload), Edit, and Delete events
- 👥 **User Management** — Manage registered student/admin accounts
- 📋 **Registrations** — View all event registrations
- 🔒 **Role-Based Access** — Admin-only dashboard sections hidden from students

---

## 🎪 Sample Events (from Database)

| Code | Event | Venue | Date |
|------|-------|-------|------|
| E1 | Civil Padura | Main Auditorium | 2026-01-13 |
| E3 | Spandana | 500 Auditorium | 2025-11-12 |
| E4 | Devthon | IT Lab | 2025-06-18 |
| E5 | SLIOT | Seminar Room | 2025-08-19 |
| E6 | CSE 40 | IT Lab | 2025-04-24 |
| E7 | Nethrawani | Grounds | 2025-07-08 |
| E10 | Ranhiru Abhiman | Ground | 2026-03-20 |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| Frontend | HTML5, CSS3, JavaScript |
| Backend | PHP (Sessions, Prepared Statements) |
| Database | MySQL |
| Icons | Font Awesome 7.0.1 (CDN) |
| Local Server | XAMPP (Apache + MySQL) |

---

## 🗄️ Database Schema

**Database name:** `itum_event_management`

| Table | Key Columns |
|-------|-------------|
| `all_events` | `event_code` (PK), `title`, `date`, `venue`, `description`, `image`, `created_at` |
| `event_users` | `registration_no` (PK), `full_name`, `email`, `phone`, `password`, `role` (Admin/Student) |
| `registration` | `event_code`, `title`, `registration_no`, `created_at` |

---

## 📁 Project Structure

```
Web_Technology_CA/
│
├── index.php               # Home page — latest 3 events
├── event.php               # All events + registration
├── about.php               # About Us page
├── contact.php             # Contact Us page
│
├── API/                    # PHP backend logic
│   ├── connection.php      # MySQL database connection function
│   ├── login.php           # Session-based login
│   ├── register.php        # Student registration (reg_no, name, email, phone, password)
│   ├── logout.php          # Session destroy & logout
│   ├── profile.php         # User profile page
│   └── event_register.php  # Event registration by event code (duplicate check)
│
├── Dashboard/              # Admin-only pages
│   ├── dashboard.php       # Role-based admin dashboard
│   ├── event_management.php  # Add / Edit / Delete events + image upload
│   ├── user_management.php   # Manage users
│   └── registration.php      # View all registrations
│
├── CSS/
│   └── style.css           # Main stylesheet (all pages)
│
├── JS/
│   ├── event.js            # Event page JavaScript
│   ├── sidebar.js          # Dashboard sidebar toggle
│   └── user.js             # User management JavaScript
│
├── Database/
│   └── itum_event_management.sql   # MySQL database dump
│
├── Images/
│   ├── background3.png / background4.jpg / bg1.jpg
│   ├── events/             # Event images
│   ├── pastEvent/          # Past event images
│   └── reviews/            # Reviewer profile images (1-5.jpg)
│
└── uploads/                # Admin-uploaded event images
    └── *.jpeg / *.png
```

---

## 🚀 Getting Started

### Prerequisites

- [XAMPP](https://www.apachefriends.org/) (Apache + MySQL)
- A web browser

### Installation Steps

1. **Clone or download the repository**
   ```bash
   git clone https://github.com/umindudinal/Web_Technology_CA.git
   ```

2. **Move the project to XAMPP's htdocs folder**
   ```
   C:/xampp/htdocs/Web_Technology_CA
   ```

3. **Import the database**
   - Start XAMPP — turn on **Apache** and **MySQL**
   - Open [http://localhost/phpmyadmin](http://localhost/phpmyadmin)
   - Create a new database named `itum_event_management`
   - Click **Import** → select `Database/itum_event_management.sql` → click **Go**

4. **Configure database connection** *(if needed)*

   Open `API/connection.php` and update:
   ```php
   $servername = "localhost";
   $username   = "root";
   $password   = "";      // your MySQL password
   $dbname     = "itum_event_management";
   ```

5. **Run the project**

   Open your browser and go to:
   ```
   http://localhost/Web_Technology_CA/index.php
   ```

---

## 🔑 Default Login Credentials

| Role | Registration No | Password |
|------|----------------|----------|
| Admin | `23IT0470` | `Umindu@123` |
| Student | `23IT0527` | `Imasha@123` |
| Student | `23CI0320` | `Dumindu@123` |

> Passwords are hashed using PHP `password_hash()`.

---

## 🧭 Pages & Navigation

| Page | File | Access |
|------|------|--------|
| Home | `index.php` | Public |
| Events | `event.php` | Public (register requires login) |
| About Us | `about.php` | Public |
| Contact Us | `contact.php` | Public |
| Login | `API/login.php` | Public |
| Register | `API/register.php` | Public |
| Profile | `API/profile.php` | Logged-in users |
| Dashboard | `Dashboard/dashboard.php` | Admin only |
| Event Management | `Dashboard/event_management.php` | Admin only |
| User Management | `Dashboard/user_management.php` | Admin only |
| Registrations | `Dashboard/registration.php` | Admin only |

---

## 👨‍💻 Author

**Umindu Dinal**
- Registration No: 23IT0470
- GitHub: [@umindudinal](https://github.com/umindudinal)
- Email: umindudinal@gmail.com

---

## 📄 License

Copyright © 2025 ITUM Events. Developed by Umindu Dinal. All Rights Reserved.

---

<p align="center">Made with ❤️ for ITUM Students</p>
