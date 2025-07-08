<?php

namespace App\Traits;

use App\Models\ActivityLog;

trait LogsActivity
{
    public function logActivity($action, $description = null, $changes = [])
    {
        ActivityLog::create([
            'user_id' => auth()->id(),
            'action' => $action,
            'description' => $description,
            'ip_address' => request()->ip(),
            'user_agent' => request()->userAgent(),
        ]);
    }
}