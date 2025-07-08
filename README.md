# Laravel Multi-Tenant Task Management API

## 🚀 Features

-   Tenant isolation via `X-Tenant-ID`
-   Laravel Sanctum authentication
-   Role-Based Access Control (Admin, Manager, Member) with Spatie
-   Tenant-scoped CRUD for Projects & Tasks
-   Manual Audit Trail logging (tasks, roles, and login)
-   JSON API responses

---

## ⚙️ Setup Instructions

```bash
# Clone repo
git clone https://github.com/yourname/laravel-multitenant-task-api.git
cd laravel-multitenant-task-api

# Install dependencies
composer install

# Environment setup
cp .env.example .env
php artisan key:generate

# Database and seeding
php artisan migrate --seed

# Start server
php artisan serve
```
