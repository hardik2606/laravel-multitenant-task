# Laravel Multi-Tenant Task Management API

## 🚀 Features

-   ✅ **Tenant Isolation** via custom `X-Tenant-ID` header
-   🔐 **Authentication** using **Laravel Sanctum**
-   🧑‍🤝‍🧑 **Role-Based Access Control** with **Spatie Laravel Permission**
-   📁 **Tenant-scoped CRUD** for Projects & Tasks
-   🕵️ **Audit Trail Logging** for login, tasks, and role activities
-   📦 **Modular & Clean API** using JSON responses
-   ⚒️ Built with **Laravel 11**, PHP 8.2+

---

## 📦 Tech Stack & Packages

| Name                      | Version | Description                  |
| ------------------------- | ------- | ---------------------------- |
| Laravel                   | ^11.x   | PHP Framework                |
| PHP                       | >=8.2   | Required PHP version         |
| Laravel Sanctum           | ^4.0    | API Token Authentication     |
| Spatie Laravel Permission | ^6.0    | Role & Permission Management |

---

## ⚙️ Installation & Setup

```bash
# Clone the repository
git clone https://github.com/hardik2606/laravel-multitenant-task.git
cd laravel-multitenant-task

# Install PHP dependencies
composer install

# Copy .env and generate app key
cp .env.example .env
php artisan key:generate

# Set DB credentials in .env file
DB_DATABASE=multitenant-task
DB_USERNAME=root
DB_PASSWORD=

# Run migrations and seeders
php artisan migrate --seed

# Start the server
php artisan serve
```

---

## 📘 Usage Guide

### 🧪 API Testing (Postman or similar)

-   **Pass `X-Tenant-ID` header** for every request to identify the tenant.
-   Use token from `/api/login` or `/api/register` responses.
-   Use Bearer token in Authorization header.

### Example Headers

```
X-Tenant-ID: 1
Authorization: Bearer <your-token>
Accept: application/json
```

---

## 👥 Roles & Access

| Role    | Permissions                             |
| ------- | --------------------------------------- |
| Admin   | Full access to all modules              |
| Manager | Can manage projects/tasks, assign users |
| Member  | Can view & update only assigned tasks   |

---

## 📑 Audit Logs

Tracked Events:

-   User login
-   Task create/update/delete
-   Role changes

Stored in `activity_logs` table.

---

## 📄 License

MIT © [Hardik Patel](https://github.com/hardik2606)
