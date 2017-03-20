@extends('layouts.app')

@section('content')

<div class="news-scroll">

@include('widgets._header_news_list')

<div class="container">
    <div class="bground">
        <div class="main">

	        <div class="news-top">
			    <div class="grid">
			        <div class="panel-body box_event_new">
			        @include('widgets/_box_popular')
			        </div>
			    </div>
			</div>
			<!-- Slide mews -->
			<div class="bginner">
			@include('widgets/_category_get_posts')
			</div>

			<div class="bginner">
			@include('widgets/_newslist_home')
			</div>
		</div>
        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
        
    </div>
</div>

@endsection
