<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Project;
use Illuminate\Support\Facades\Validator;

class ProjectController extends Controller
{
    public function index(){
        $tenant = app('tenant');
        $projects = Project::where('tenant_id', $tenant->id)->get();
         return response()->json([
            'status'=> true,
            'message' => 'project Retrived successfully',
            'data' => ['projects' => $projects]   
        ],200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
       ]);
        if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => $validator->errors()->first(),
                    'data' => null
                ], 422);
        }
        try {
            $tenant = app('tenant');
            $project = Project::create([
                'name' => $request->name,
                'tenant_id' => $tenant->id,
            ]);
            return response()->json([
                'status'=> true,
                'message' => 'Project created successfully',
                'data' => ['project'=>$project]   
            ]);
      } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
      }
   }

    public function update(Request $request, $id)
    { 
        $tenant = app('tenant');
        $project = Project::where('tenant_id', $tenant->id)->findOrFail($id);
        if($project->tenant_id !== $tenant->id) {
            return response()->json(['status' => false, 'message' => 'Project not found','data'=> null], 404);
        }
        $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
       ]);
        if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => $validator->errors()->first(),
                    'data' => null
                ], 422);
        }
        try {
            $project->update(['name' => $request->name]);
            return response()->json(['status'=> true,'message' => 'Project updated successfully', 'project' => $project],200);
        } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
      }
    }

    public function destroy($id)
    {
        $tenant = app('tenant');
        try {
                $project = Project::where('tenant_id', $tenant->id)->findOrFail($id);
                if($project->tenant_id !== $tenant->id || !$project) {
                    return response()->json(['status' => false, 'message' => 'Project not found'], 404);
                }
                $project->delete();
                return response()->json(['status' => true,'message' => 'Project deleted successfully', 'data' =>[]], 200);
         } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
        }
    }
}


