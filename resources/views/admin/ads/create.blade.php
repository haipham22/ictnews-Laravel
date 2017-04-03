@extends('layouts.admin')

@section('title')@lang('admin.ads.edit')@endsection

@section('scripts')

{!! Html::script('plugins/tinymce/tinymce.min.js') !!}
{!! Html::script('js/ckeditor-custom.js') !!}
<script>
    $(document).ready(function(){
        ckeditor("#code");
    });
</script>
@endsection

@section('content')
<div class="content">
	<div class="box box-danger">
	    <div class="box-header with-border">
	      	<h3 class="box-title">@lang('admin.ads.title')</h3>
	    </div>
	    <div class="box-body">
        {!! Form::model($ads, ['method' => is_active('ads.create') ? 'POST' : 'PUT', 'autocomplete' => 'off', 'route' => is_active('ads.create') ? 'ads.store': ['ads.update', $ads->id]]) !!}
            <div class="col-md-12">
                <div class="form-group {!! $errors->has('name') ? 'has-error' : '' !!}">
                    {!! Form::label('name', trans('admin.ads.name')) !!}
                    {!! Form::text('name', old('name'), ['class' => 'form-control', 'placeholder' => trans('admin.ads.name')]) !!}
                    @if($errors->has('name'))
                        <span class="help-block">{!! $errors->first('name') !!}</span>
                    @endif
                </div>
                <div class="form-group">
                    {!! Form::label('status', trans('admin.ads.status')) !!}
                    {{--{!! Form::number('status', old('status'),['class' => 'form-control']) !!}--}}
                    {!! Form::select('status', [trans('admin.ads.status.hide'), trans('admin.ads.status.show')], old('status'), ['class' => 'form-control']) !!}
                </div>
                <div class="form-group {!! $errors->has('code') ? 'has-error' : '' !!}">
                    {!! Form::label('code', trans('admin.ads.code')) !!}
                    {!! Form::textarea('code', old('code'), ['class' => 'form-control', 'id' => 'code', 'placeholder' => trans('admin.ads.code')]) !!}
                    @if($errors->has('code'))
                        <span class="help-block">{!! $errors->first('code') !!}</span>
                    @endif
                </div>
            </div>
            <div class="form-group">
            {!! Form::submit(trans('admin.ads.submit'), ['class' => 'btn btn-lg btn-primary']) !!}
            </div>
        {!! Form::close() !!}
    </div>
</div>
@endsection
