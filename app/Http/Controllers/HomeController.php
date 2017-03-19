<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Posts;
use App\Categories;

class HomeController extends Controller
{

    public function index()
    {
        $posts = Posts::orderBy('created_at', 'DESC')
                    ->limit(10)
                    ->get();

        $categories = Categories::all();

        return view('home',compact('posts','categories'));
    }

    public function search(Request $request)
    {
        $keyword = $request->keyword;
        $posts   = Posts::orderBy('created_at', 'DESC')
                    ->where('title','like',"%$keyword%")
                    ->orwhere('description','like',"%$keyword%")
                    ->orwhere('content','like',"%$keyword%")
                    ->get();
        return view('widgets.search',compact('posts','keyword'));
    }

    public function getProfile(){
        return view('user.profile');
    }

}
