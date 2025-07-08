<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\ActivityLog;
use Illuminate\Support\Facades\Hash;
use Validator;
use App\Traits\LogsActivity;

class AuthController extends Controller
{
  use LogsActivity;
  public function register(Request $request){
    $validator = Validator::make($request->all(), [
        'tenanat_id'=> 'required|integer',
        'name' => 'required',
        'email' => 'required|email|unique:users',
        'password' => 'required|min:8',
        'role' => 'required|in:Admin,Manager,Member'
    ]);

   if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors()->first(),
        ], 422);
    }
 try {
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'tenant_id' => $request->tenanat_id
        ]);
        $user->assignRole($request->role);
        $this->logActivity(
            'role_assigned',
            "Assigned role $request->role to {$user->email}.",
        );
        return response()->json([
            'status' => true,
            'message' => 'Tenant registered successfully',
            'data' => ['users'=>$user,'token' => $user->createToken('api-token')->plainTextToken]    
        ],200);
    } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
     }
}

public function login(Request $request)
{
    $validator = Validator::make($request->all(), [
        'email' => 'required|email',
        'password' => 'required|min:8',
    ]);

   if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors()->first(),
        ], 422);
    }
   try {
        $user = User::where('email', $request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {

             $this->logActivity(
            'login_fail',
            "Login fail for user {$request->email}.",
        );
            return response()->json(['status' => false,'message' => 'Invalid credentials','data' =>[]], 401);
        }
        $this->logActivity(
            'login_success',
            "Login success for user {$request->email}.",
        );
        return response()->json([
            'status'=> true,
            'message' => 'Tenant Login successfully',
            'data' => ['users'=>$user,'token' => $user->createToken('api-token')->plainTextToken]   
        ]);
     } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
     }
}

}
