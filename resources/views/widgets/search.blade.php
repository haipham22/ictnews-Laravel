@extends('layouts.app')

@section('content')

<div class="news-scroll">

<div class="container">
    <div class="bground">
        <div class="main">
            <div class="main-small">
                <div class="box wrapper-list">
			        <div class="box-title">
			            <div class="lb-name">Tìm kiếm từ khóa: {{ $keyword }} ({{ count($posts)}} kết quả)</div>
			        </div>
					<div class="box-content">
                        <div class="news-list">
                            <ul>
                            @if(count($posts) > 0)
                            	@foreach($posts as $post)
                                <li>
                                    <div class="grid row">
                                        <div class="col-md-4 hidden-xs hidden-sm">
                                        	<a href="{{ URL::route('posts.getPost',$post->slug) }}">
                                        		<img class="img-responsive" src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}">
                                        	</a>
                                        </div>
                                        <div class="col-md-8">
            	                            <div class="g-content">
            	                                <div class="g-row">
            	                                    <a class="g-category" href="{{ URL::route('categories.getCate',$post->Categories->slug) }}"><i class="fa fa-list"></i> {!! $post->categories->name !!} - <i class="fa fa-clock-o"></i> {{ $post->created_at }}</a>
            	                                </div>
            	                                <div class="g-row">
            	                                    <a class="g-title" href="{{ URL::route('posts.getPost',$post->slug) }}">
            	                                    	<h2>{{$post->title}}</h2>
            	                                    </a>
            	                                </div>
            	                                <div class="g-row">
            	                                    {!! str_limit($post->description) !!}
            	                                </div>
            	                            </div>
                                        </div>
                                    </div><!-- grid -->
                                </li>
                            	@endforeach
                            @else
								@lang('home.notsearch')
                            @endif
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div><!-- box-content -->
                </div><!-- box -->

                <div class="news-more">
                    {{ $posts->links() }}
                </div>

            </div>
            <div class="sidebar-small">
            @include('widgets/_sidebar_small')
            </div>
        </div>

        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
    </div>
</div>
@endsection