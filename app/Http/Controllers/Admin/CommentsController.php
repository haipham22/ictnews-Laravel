<?php

namespace App\Http\Controllers\Admin;

use App\Comments;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Session;

class CommentsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $comment = Comments::all();

        return view('admin.comments.index', [
            'comments'  => $comment
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $parent = Comments::find($request->parent_id);

        if (!$parent->status) {
            $parent->update([
                'status'    => 1,
            ]);
        }
        $comment = Comments::create($request->all());

        return $comment;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return view('admin.comments.edit')
            ->with([
                'comments'  => Comments::find($id),
            ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $comments = Comments::find($id);
        $comments->update($request->all());

        return redirect()->route('comments.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     * @throws \Exception
     */
    public function destroy($id)
    {
        try {
            $comments = Comments::find($id);
            $comments->delete();
            Session::flash('msg_success', trans('admin.comments.deleted'));
            return redirect()->back();
        } catch (\Exception $exception) {
            throw new \Exception($exception->getMessage());
            Session::flash('msg_danger', $exception->getMessage());
            return redirect()->back();
        }
        /*try {
            $comments = Comments::find($id);
            $comments->delete();
            return response()->json([
                'results'   => true,
                'msg'   => trans('admin.comments.deleted'),
            ]);

        } catch (\Exception $e) {
            return response()->json([
                'results'   => false,
                'msg'   => $e->getMessage()
            ]);
        }*/
    }

    public function setStatus(Request $request, $id)
    {
        $comments = Comments::find($id);

        if ($comments->update($request->all())):
            return response()->json([
                'status' => true,
                'messages' => trans('admin.comments.updated.status')
            ]);
        endif;
        return response()->json([
            'status' => false,
            'messages' => trans('admin.comments.errors')
        ]);
    }
}
