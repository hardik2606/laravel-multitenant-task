<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;


class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::create(['name' => 'Admin', 'guard_name' => 'api']);
        Role::create(['name' => 'Manager', 'guard_name' => 'api']);
        Role::create(['name' => 'Member', 'guard_name' => 'api']);
    }
}
