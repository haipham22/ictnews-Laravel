@extends('layouts.admin')

@section('title', trans('admin.post.create'))

@section('styles')
{!! Html::style('plugins/fancybox/dist/jquery.fancybox.min.css') !!}
@endsection

@section('scripts')

{!! Html::script('plugins/tinymce/tinymce.min.js') !!}
{!! Html::script('plugins/fancybox/dist/jquery.fancybox.min.js') !!}
{!! Html::script('js/ckeditor-custom.js') !!}
{!! Html::script('js/jquery.observe_field.js') !!}

<script>
    $(document).ready(function(){
        ckeditor("#description");
    });
    $(document).ready(function(){
        ckeditor("#content");
    });

    $('.iframe-btn').fancybox({ 
        'width'     : 900,
        'height'    : 600,
        'type'      : 'iframe',
        'autoScale' : false
    });

    $(function() {
        // Executes a callback detecting changes with a frequency of 1 second
        $("#image_link").observe_field(1, function( ) {
            // alert('Change observed! new value: ' + this.value );
            $('#image_preview').attr('src',this.value).show();
            fancybox.close();

        });
    });
</script>
@endsection

@section('content')
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">@lang('admin.post.create')</h3>
        </div>
        <div class="box-body">
        {!! Form::model($posts, ['method' => is_active('posts.create') ? 'POST' : 'PUT', 'autocomplete' => 'off', 'route' => is_active('posts.create') ? 'posts.store': ['posts.update', $posts->id]]) !!}

            <div class="col-md-8">
                    <div class="form-group {!! $errors->has('title') ? 'has-error' : '' !!}">
                        {!! Form::label('title', trans('admin.post.title')) !!}
                        {!! Form::text('title', old('title'), ['class' => 'form-control', 'placeholder' => trans('admin.post.title')]) !!}
                        @if($errors->has('title'))
                            <span class="help-block">{!! $errors->first('title') !!}</span>
                        @endif
                    </div>
                    <div class="form-group {!! $errors->has('slug') ? 'has-error' : '' !!}">
                        {!! Form::label('slug', trans('admin.post.slug')) !!}
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon3">{!! config('app.url') !!}/</span>
                            {!! Form::text('slug', old('slug'), ['class' => 'form-control', 'placeholder' => trans('admin.post.slug')]) !!}
                        </div>
                        @if($errors->has('slug'))
                            <span class="help-block">{!! $errors->first('slug') !!}</span>
                        @endif
                    </div>
                    <div class="form-group {!! $errors->has('description') ? 'has-error' : '' !!}">
                        {!! Form::label('description', trans('admin.post.description')) !!}
                        {!! Form::textarea('description', old('description'), ['class' => 'form-control', 'id' => 'description', 'placeholder' => trans('admin.post.description')]) !!}
                        @if($errors->has('description'))
                            <span class="help-block">{!! $errors->first('description') !!}</span>
                        @endif
                    </div>
                    <div class="form-group {!! $errors->has('content') ? 'has-error' : '' !!}">
                        {!! Form::label('content', trans('admin.post.content')) !!}
                        {!! Form::textarea('content', old('content'), ['class' => 'form-control', 'id' => 'content', 'content' => trans('admin.post.content')]) !!}
                        @if($errors->has('content'))
                            <span class="help-block">{!! $errors->first('content') !!}</span>
                        @endif
                    </div> 

                </div>
                <div class="col-md-4">
                    @if(is_active('posts.edit'))
                        <div class="form-group">
                            {!! Form::label('view', trans('admin.post.view')) !!}
                            {!! Form::number('view', old('view'), ['class' => 'form-control']) !!}
                        </div>
                    @endif
                    <div class="form-group {!! $errors->has('status') ? 'has-error' : '' !!}">
                        {!! Form::label('status', trans('admin.post.status')) !!}
                        {!! Form::select('status', [trans('admin.post.notpublic'), trans('admin.post.publish')], old('status') ,['class' => 'form-control']) !!}
                        @if($errors->has('status'))
                            <span class="help-block">{!! $errors->first('status') !!}</span>
                        @endif
                    </div>
                    <div class="form-group {!! $errors->has('cate_id') ? 'has-error' : '' !!}">
                        {!! Form::label('cate_id', trans('admin.post.cate')) !!}
                        {!! Form::select('cate_id', $categories, null ,['class' => 'form-control', 'placeholder' => '--CHỌN CHUYÊN MỤC--']) !!}
                        @if($errors->has('cate_id'))
                            <span class="help-block">{!! $errors->first('cate_id') !!}</span>
                        @endif
                    </div>
                    <div class="form-group {!! $errors->has('type') ? 'has-error' : '' !!}">
                        {!! Form::label('type', trans('admin.post.type')) !!}
                        {!! Form::select('type', ['Văn bản', 'Hình ảnh', 'Video'], 0 ,['class' => 'form-control']) !!}
                        @if($errors->has('type'))
                            <span class="help-block">{!! $errors->first('type') !!}</span>
                        @endif
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-6">
                            {!! Form::label('thumbnail', trans('admin.post.thumbnail')) !!}
                            </div>
                            <div class="col-xs-6">
                                <div class="pull-right">
                                {!! Form::text('thumbnail', old('thumbnail'), ['class' => 'btn btn-xs btn-default hidden', 'id' => 'image_link']) !!}
                                <a class="btn btn-xs btn-default iframe-btn" type="button" href="/filemanager/dialog.php?type=1&field_id=image_link">chọn ảnh</a>
                                </div>
                            </div>
                        </div>

                        {!! Form::image(is_active('posts.create') ? '/uploads/img/default-thumbnail.jpg' : $posts->thumbnail,'',['class' => 'img-responsive', 'id' => 'image_preview']) !!} <!-- Show ảnh đại diện -->

                        @if($errors->has('thumbnail'))
                            <span class="help-block">{!! $errors->first('thumbnail') !!}</span>
                        @endif
                    </div>

                    <div class="form-group pull-right">
                        {!! Form::submit(trans('admin.post.submit'), ['class' => 'btn btn-lg btn-primary']) !!}
                    </div>
                </div>    
            {!! Form::close() !!}
        </div>
    </div>
@endsection

