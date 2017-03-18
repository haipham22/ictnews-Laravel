@extends('layouts.app')

@section('content')

<div class="news-scroll">

<div class="container">
    <div class="bground">
        <div class="main">
			<div class="row">
				<div class="col-md-12">
				    <div class="box wrapper-list">
				        <div class="box-title">
				            <div class="lb-name">{{ $pages->name }}</div>
				        </div>
				    </div>
				    <div class="bginner">
				    {!! $pages->content !!}
				    </div>
				</div>
			</div>
        </div>

        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
        
    </div>
</div>

@endsection
