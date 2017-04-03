@extends('layouts.admin')

@section('title', trans('admin.post.seach'))

@section('content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">@lang('admin.post.seach'): {{ $keyword }}</h3>
    </div>
    <div class="box-body">
        <table class="table table-striped">

            <div class="row">
                <div class="col-md-12">
                    <div class="pull-right">
                        <div class="form-group">
                            <div class="input-group">
                                <form action="{{ route('postsearch') }}" method="POST">
                                    {{ csrf_field() }}
                                    <div class="col-md-8">
                                        <input type="text" class="form-control input-sm" name="keyword">
                                    </div>
                                    <button type="submit" class="col-md-4 btn btn-sm btn-search">Tìm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

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
            @if(count($posts) > 0)
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
            @else
                @lang('home.notsearch')
            @endif
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