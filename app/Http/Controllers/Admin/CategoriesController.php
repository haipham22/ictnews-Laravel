<?php

namespace App\Http\Controllers\Admin;

use App\Categories;
use App\Http\Requests\CategoriesRequest;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Session;
use Validator;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $category = Categories::all();

        return view('admin.categories.index')
            ->with([
                'categories'    => $category
            ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Categories::select('id', 'name')
            ->where('parent', '0')
            ->get()->mapWithKeys(function ($item) {
                return [$item['id'] => $item['name']];
            });
//        var_dump($categories);die;
        return view('admin.categories.create', [
            'category'      => [],
            'categories'    => $categories,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  CategoriesRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CategoriesRequest $request)
    {
        Validator::make(Input::only('name'), [
            'name'  => 'unique:categories,name'
        ])->validate();

        Categories::create($request->all());

        Session::flash('msg_success', trans('admin.cate.created'));

        return redirect()->route('categories.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $category = Categories::find($id);
        $categories = Categories::where('parent', $category->id)->get();

        return view('admin.categories.index', compact('category', 'categories'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $categories = Categories::select('id', 'name')
            ->where([
                ['parent', '0'],
                ['id', '<>', $id]
            ])
            ->get()->mapWithKeys(function ($item) {
                return [$item['id'] => $item['name']];
            });
        $category = Categories::find($id);
        return view('admin.categories.create', [
            'category'      => $category,
            'categories'    => $categories,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  CategoriesRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CategoriesRequest $request, $id)
    {
        $category = Categories::find($id);
        if ($category->update($request->all()))
        {
            Session::flash('msg_success', trans('admin.cate.updated'));
            return redirect()->route('categories.index');
        }
        Session::flash('msg_danger', trans('admin.cate.updated'));
        return redirect()->back();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Categories::find($id);

        // Chuyện kể rằng có 1 thanh niên lười dùng foreach để thay đổi chuyên mục cha
        // nên bạn ấy chơi như này :))
        $child = Categories::where('parent', $id)->get();

        if ($child->count() > 0) {
            return response()->json([
                'results'   => false,
                'msg'   => 'Xóa chuyên mục con trước',
            ]);
        }

        $category->delete();

        return response()->json([
            'results'   => true,
            'msg'   => trans('admin.cate.deleted'),
        ]);

        /*try {
            $category = Categories::find($id);
            $category->delete();
            return response()->json([
                'results'   => true,
                'msg'   => trans('admin.cate.deleted'),
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'results'   => false,
                'msg'   => $e->getMessage()
            ]);
        }*/
    }
}
