<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Tenant;
use Illuminate\Support\Str;

class TenantSeeder extends Seeder
{
    public function run(): void
    {
        $count = 10;

        for ($i = 0; $i < $count; $i++) {
            $name = fake()->company();
            Tenant::create([
                'name' => $name,
                'slug' => Str::slug($name),
            ]);
        }
    }
}
