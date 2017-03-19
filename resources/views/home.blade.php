@extends('layouts.app')

@section('content')

<div class="news-scroll">

<div class="container">
    <div class="bground">
        <div class="main">

	        <div class="news-top">
			    <div class="grid">
			        <div class="panel-body box_event_new">
			        @foreach($posts as $post)
			        	@if ($loop->first)
			            <div class="col-sm-6">
			                <div class="module-thumb col-md-12">
			                    <a href="{{ URL::route('posts.getPost',$post->slug) }}" class="thumb16x9">
			                        <img style="background:#ececec" src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}" width="374" height="250"> 
			                    </a>
			                </div>
			                <div class="col-md-12">
			                    <h3>
			                        <a href="{{ URL::route('posts.getPost',$post->slug) }}" class="g-title">{!! $post->title !!}</a>
			                    </h3>
			                    <p class="public-post">
			                        <a href="{{ URL::route('categories.getCate',$post->categories->slug) }}" class="g-category"><i class="fa fa-list"></i> {!! $post->categories->name !!} - <i class="fa fa-clock-o"></i> 10 Phút trước</a> 
			                    </p>
			                    <p class="public-post">{!! str_limit($post->description) !!}</p>
			                </div>
			            </div>
						@else
			            <div class="col-sm-6 posts-sk">
			                <h5>
			                    <a href="{{ URL::route('posts.getPost',$post->slug) }}" class="g-title">{!! $post->title !!}</a>
			                    <p class="public-post">
			                        <a href="{{ URL::route('categories.getCate',$post->categories->slug) }}" class="g-category"><i class="fa fa-list"></i> {!! $post->categories->name !!} - <i class="fa fa-clock-o"></i> {!! $post->created_at !!}</a> 
			                    </p>
			                </h5>
			            </div>
			       		@endif
					@endforeach           
			        </div>
			    </div>
			</div>
			<!-- Slide mews -->

		</div>
        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
        
    </div>
</div>

@endsection
