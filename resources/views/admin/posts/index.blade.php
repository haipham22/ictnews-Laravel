@extends('layouts.admin')

@section('title', trans('admin.post.index'))

@section('content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">@lang('admin.post.index')</h3>

        <div class="box-tools">
            <form action="{{ route('postsearch') }}" method="POST">
                <div class="input-group input-group-sm" style="width: 150px;">
                    {{ csrf_field() }}
                    <input type="text" name="keyword" class="form-control pull-right" placeholder="Tìm kiếm" required>
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="box-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>@lang('admin.post.thumbnail')</th>
                    <th>@lang('admin.post.title')</th>
                    <th>@lang('admin.post.usercreated')</th>
                    <th>@lang('admin.post.categories')</th>
                    <th>@lang('admin.post.time')</th>
                    <th>@lang('admin.post.publish')</th>
                    <th>@lang('admin.post.tool')</th>
                </tr>
            </thead>
            <tbody>
                @php($i = 0)
                @foreach($posts as $post)
                    @php($i++)
                    <tr>
                        <td>{!! $i !!}</td>
                        <td><img src="{!! $post->thumbnail !!}" width="50px"></td>
                        <td>{!! link_to_route('posts.edit', $post->title, ['posts' => $post->id]) !!}</td>
                        <td>{!! $post->user->username !!}</td>
                        <td>{!! $post->Categories->name !!}</td>
                        <td>{!! $post->updated_at !!}</td>
                        <td>{!! $post->status !!}</td>
                        <td>
                            {!! link_to_route('posts.edit', 'Sửa', ['posts' => $post->id], ['class' => 'btn btn-xs btn-info']) !!}
                            {!! link_to_route('posts.destroy', 'Xóa', ['posts' => $post->id], ['class' => 'delete btn btn-xs btn-danger']) !!}
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-sm-5">
        </div>
        <div class="col-sm-7">
            {{ $posts->links() }}
        </div>
    </div>
</div>
@endsection