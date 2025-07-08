<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tasks', function (Blueprint $table) {
           $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->tinyInteger('status')->default(0)->comment('0: open, 1: in progress, 2: closed'); // 0: open, 1: in progress, 2: closed
            $table->date('deadline');
            $table->foreignId('project_id')->constrained('projects')->onDelete('cascade');
            $table->foreignId('assigned_user_id')->nullable()->constrained('users');
            $table->foreignId('tenant_id')->constrained('tenants')->onDelete('cascade');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
