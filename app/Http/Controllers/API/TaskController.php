<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use App\Models\Project;
use App\Models\Task;
use App\Traits\LogsActivity;


class TaskController extends Controller
{
    use LogsActivity;
    public function index($projectId)
    {
        $tenant = app('tenant');
        $project = Project::where('tenant_id', $tenant->id)->findOrFail($projectId);
        $tasks = $project->with('tasks','tasks.assignedUser')->get();

        return response()->json(['tasks' => $tasks]);
    }

    public function store(Request $request)
    {
        $tenant = app('tenant');
         $validator = Validator::make($request->all(), [
            'project_id' => 'required|exists:projects,id',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'status' => 'in:0,1,2', // 0: open, 1: in progress, 2: closed
            'deadline' => 'required|date|after_or_equal:today',
            'assigned_user_id' => 'required|exists:users,id',
       ]);
        if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => $validator->errors()->first(),
                    'data' => null
                ], 422);
        }

        if (!auth()->user()->hasAnyRole(['Admin', 'Manager'])) {
            return response()->json(['status' => false,'message' => 'Permission denied','data' =>[]], 403);
        }

         try {
            $project = Project::findOrFail($request->project_id);
            $tenant = app('tenant');
            if ($project->tenant_id !== $tenant->id) {
                return response()->json(['status' => false, 'message' => 'Unauthorized','data' => null], 403);
            }
            $task = $project->tasks()->create([
                'title' => $request->title,
                'description' => $request->description ?? null,
                'status' => $request->status ?? 0,
                'deadline' => $request->deadline,
                'assigned_user_id' => $request->assigned_user_id,
                'tenant_id' => $tenant->id
            ]);

             $this->logActivity( 
                'task_updated',
                "Task created by ".auth()->user()->name
            );
            return response()->json(['status' => true,'message' => 'Task created successfully', 'data' => ['task' => $task]], 201);
        } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
        }
    }


    public function update(Request $request, $id)
    {
        $task = Task::with('project')->findOrFail($id);
        $tenant = app('tenant');
        $old = $task->toArray();
        if ($task->tenant_id !== $tenant->id) {
                return response()->json(['status' => false, 'message' => 'Unauthorized','data' => null], 403);
            }

        if (!auth()->user()->hasRole('Admin') && (!auth()->user()->hasRole('Member') || auth()->id() !== $task->assigned_user_id)) {
            return response()->json(['status' => false,'message' => 'Permission denied','data' =>[]], 403);
        }
       $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'status' => 'in:0,1,2', // 0: open, 1: in progress, 2: closed
            'deadline' => 'required|date|after_or_equal:today',
            'assigned_user_id' => 'required|exists:users,id',
       ]);
        if ($validator->fails()) {
                return response()->json([
                    'status' => false,
                    'message' => $validator->errors()->first(),
                    'data' => null
                ], 422);
        }
         try {
            $task->update([
                'title' => $request->title,
                'description' => $request->description ?? null,
                'status' => $request->status ?? 0,
                'deadline' => $request->deadline,
                'assigned_user_id' => $request->assigned_user_id
            ]);

            $this->logActivity( 
                'task_updated',
                "Task updated by ".auth()->user()->name
            );
            
            return response()->json(['status' => true,'message' => 'Task updated successfully', 'data' => ['task' => $task]], 200);
         } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
        }
    }

    public function destroy($id)
    {
        $task = Task::with('project')->findOrFail($id);
        $tenant = app('tenant');

        if ($task->tenant_id !== $tenant->id) {
            return response()->json(['status' => false, 'message' => 'Unauthorized','data' => null], 403);
        }
        if (!auth()->user()->hasAnyRole(['Admin', 'Manager'])) {
            return response()->json(['status' => false,'message' => 'Permission denied','data' =>[]], 403);
        }
        try {
        $task->delete();

         $this->logActivity( 
                'task_updated',
                "Task deleted by ".auth()->user()->name
            );
           return response()->json(['status' => true,'message' => 'Task deleted successfully', 'data' => []], 200);
         } catch (Exception $ex) {
            return response()->json(['status' => false,'message' => $ex->getMessage(),'data' =>[]], 500);
        }
    }

}
