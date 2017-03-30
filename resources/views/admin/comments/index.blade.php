@extends('layouts.admin')

@section('title', trans('admin.comments.index'))

@section('styles')
    {!! Html::style('plugins/datatables/dataTables.bootstrap.css') !!}
@endsection

@section('scripts')
    {!! Html::script('plugins/datatables/jquery.dataTables.min.js') !!}
    {!! Html::script('plugins/datatables/dataTables.bootstrap.min.js') !!}
    <script type="text/javascript">
        $('.btn-status').click(function (e) {
            e.preventDefault();
            var btn = $(this);
            $.post(btn.attr('href'), {
                _token: window.Laravel.csrfToken,
                status: btn.attr('status'),
            }, function (data) {
                if (data.status) {
                    alert(data.messages);
                    window.location.reload();
                }
            });
        })
        $('.modal-dialog').on('click', '.btn-send-comment', function () {
            var content,
                parent_id,
                user_id,
                post_id,
                form = $(this).closest('.modal-dialog'),
                send = function () {
                    $.post(form.find('#reply_url').val(), {
                        _token: window.Laravel.csrfToken,
                        post_id: post_id,
                        parent_id: parent_id,
                        user_id: user_id,
                        status: 1,
                        content: content.replace(/\r\n|\r|\n/g, "<br/>"),
                    }, function (data) {
                        window.location.reload();
                    });
                };
//            console.log(form.find('textarea').val());
            return (content = form.find('textarea:first').val(), user_id = $(this).attr('user_id'), post_id = $(this).attr('post_id'), parent_id = $(this).attr('parent_id'), content.length == 0) ? (form.find(".form-group").addClass("has-error").find("label").html("Bạn chưa nhập nội dung ý kiến !"), !1) : content.length < 10 ? (form.find(".form-group").addClass("has-error").find("label").html("Nội dung ý kiến quá ngắn !"), !1) : content.length > 1e3 ? (form.find(".form-group").addClass("has-error").find("label").html("Nội dung ý kiến quá dài !"), !1) : (send(), !1)
        });
    </script>
@endsection

@section('content')
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">@lang('admin.comments.index')</h3>
        </div>
        <div class="box-body">
            <table class="table table-striped" id="list">
                <thead>
                    <tr>
                        <th>@lang('admin.comments.name')</th>
                        <th>@lang('admin.comments.content')</th>
                        <th>@lang('admin.comments.parent')</th>
                        <th>@lang('admin.comments.updatedat')</th>
                        <th>@lang('admin.comments.tool')</th>
                    </tr>
                </thead>
                <tbody>
                    @if(count($comments) > 0)
                        @foreach($comments as $comment)
                            @if($comment->parent_id == 0)
                                <tr id="{!! $comment->id !!}">
                                    <td>{!! $comment->name !!}</td>
                                    <td>
                                        {!! $comment->content !!}
                                        <p>
                                            <button class="btn btn-xs" data-toggle="modal" data-target="#reply-{!! $comment->id !!}">Trả lời</button>
                                            <a href="{!! route('comments.edit', ['comment' => $comment->id]) !!}" class="btn btn-default btn-xs">Sửa</a>
                                        </p>
                                        <div id="reply-{!! $comment->id !!}" class="modal fade reply" role="dialog">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Trả lời bình luận {!! str_limit($comment->content, 20) !!}</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="form">
                                                            <div class="form-group" style="width: 100%;">
                                                                <textarea name="content" cols="30"
                                                                          rows="5" class="content-{!! $comment->id !!} form-control" style="width: 100%;"></textarea>
                                                                <label for="content" class="control-label help-block">Nội dung</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                                        <button type="button" reply_url="{!! route('comments.store') !!}" post_id="{!! $comment->post_id !!}"
                                                                parent_id="{!! $comment->id !!}" user_id="{!! \Auth::user()->id !!}" class="btn-send-comment btn btn-info">Gửi</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <a href="{!! route('posts.edit', ['slug' => $comment->post_id]) !!}">{!! $comment->parent !!}</a>
                                    </td>
                                    <td><a href="{!! route('posts.getPost', ['slug' => $comment->post()->first()->slug]) !!}#{!! $comment->id !!}">{!! $comment->created_at !!}</a></td>
                                    <td>
                                        {!! Form::open(['action' => ['Admin\CommentsController@update', $comment->id], 'method' => 'PUT', 'class' => 'pull-left']) !!}
                                            {!! Form::hidden('status', $comment->status ? 0 : 1) !!}
                                            {!! Form::submit($comment->status ? 'Ẩn' : 'Hiện', ['class' => 'btn-xs btn btn-success']) !!}
                                        {!! Form::close() !!}

                                        {!! Form::open(['action' => ['Admin\CommentsController@destroy', $comment->id], 'method' => 'DELETE', 'class' => 'pull-right']) !!}
                                            {!! Form::submit('Xóa', ['class' => 'btn-xs btn btn-danger']) !!}
                                        {!! Form::close() !!}
                                    </td>
                                </tr>
                                @foreach($comments as $sub)
                                    @if($sub->parent_id == $comment->id)
                                        <tr id="{!! $sub->id !!}">
                                            <td>{!! $sub->name !!}</td>
                                            <td>
                                                <p><a href="#{!! $sub->parent_id !!}">Trả lời tới {!! $comment->name !!}</a></p>
                                                <p>{!! $sub->content !!}</p>
                                                <p>
                                                    <a href="{!! route('comments.edit', ['comment' => $sub->id]) !!}" class="btn btn-default btn-xs">Sửa</a>
                                                </p>
                                            </td>
                                            <td>
                                                <a href="{!! route('posts.edit', ['slug' => $sub->post_id]) !!}">{!! $sub->parent !!}</a>
                                            </td>
                                            <td><a href="{!! route('posts.getPost', ['slug' => $sub->post()->first()->slug]) !!}#{!! $sub->id !!}">{!! $sub->created_at !!}</a></td>
                                            <td>
                                                {!! Form::open(['action' => ['Admin\CommentsController@update', $sub->id], 'method' => 'PUT', 'class' => 'pull-left']) !!}
                                                    {!! Form::hidden('status', $sub->status ? 0 : 1) !!}
                                                    {!! Form::submit($sub->status ? 'Ẩn' : 'Hiện', ['class' => 'btn-xs btn btn-success']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(['action' => ['Admin\CommentsController@destroy', $sub->id], 'method' => 'DELETE', 'class' => 'pull-right']) !!}
                                                    {!! Form::submit('Xóa', ['class' => 'btn-xs btn btn-danger']) !!}
                                                {!! Form::close() !!}
                                            </td>
                                        </tr>
                                    @endif
                                @endforeach
                            @endif
                        @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
@endsection