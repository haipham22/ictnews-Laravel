<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
Use App\User;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {   
        $data = User::orderBy('created_at')
                    ->paginate(20);
        return view('admin.users.index',compact('data'));
    }

    public function setadmin($id)
    {
        $data = User::findOrFail($id);
        $data->role = 2;
        $data->save();
            \Session::flash('msg_success', 'Đã chỉ định thành viên làm admin!');
        return redirect()->back();
    }

    public function delete($id)
    {
        $data = User::findOrFail($id);
        $data->delete();
            \Session::flash('msg_success', 'Xóa bài viết thành công!');
        return redirect()->back();
    }
}
