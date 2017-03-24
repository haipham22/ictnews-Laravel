@extends('layouts.admin')

@section('title', trans('admin.comments.index'))

@section('content')
    <div class="box">
        <div class="box-header">
            <h3 class="box-title">@lang('admin.comments.edit')</h3>
        </div>
        <div class="box-body">
            {!! Form::model($comments, ['method' => 'put', 'action' => ['Admin\CommentsController@update', $comments->id]]) !!}
                <div class="form-group {!! $errors->has('content') ? 'has-error' : '' !!}">
                    {!! Form::label('content', trans('admin.comments.content')) !!}
                    {!! Form::textarea('content', old('content'), ['class' => 'form-control', 'placeholder' => trans('admin.comments.content')]) !!}
                    @if($errors->has('content'))
                        <span class="help-block">{!! $errors->first('content') !!}</span>
                    @endif
                </div>
                <div class="form-group">
                    {!! Form::submit(trans('admin.comments.submit'), ['class' => 'btn btn-primary btn-block']) !!}
                </div>
            {!! Form::close() !!}
        </div>
    </div>
@endsection