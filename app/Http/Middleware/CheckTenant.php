<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use App\Models\Tenant;

class CheckTenant
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $tenantId = $request->header('X-Tenant-ID');
        $tenant = Tenant::where('id', $tenantId)->first();
        if (!$tenant) {
             return response()->json(['status' => false,'message' => 'Invalid Tenant Id','data' =>[]], 403);
        }
       app()->instance('tenant', $tenant);   
        return $next($request);
    }
}

