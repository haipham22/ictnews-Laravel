@extends('layouts.app')

@section('content')

<div class="news-scroll">

<div class="container">
    <div class="bground">
        <div class="main">
			<div class="row">
		       	<div class="col-md-8">
				    <div class="box wrapper-list">
				        <div class="box-title">
				            <div class="lb-name">Kết quả tìm kiếm cho từ khóa: {{ $keyword }}</div>
				        </div>
						<div class="box-content">
			            @if($posts > 0)
			                <div class="news-list">
			                    <ul>
						       	@foreach($posts as $post)
			                        <li>
									    <div class="grid">
									        <div class="img"><a href="{{ URL::route('posts.getPost',$post->slug) }}" title=""><img src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}"></a></div>
									        <div class="g-content">
									            <div class="g-row">
									                <a class="g-category" href="#"><i class="fa fa-list"></i> {!! $post->categories->name !!}</a>
									            </div>
									            <div class="g-row">
									                <a class="g-title" href="{{ URL::route('posts.getPost',$post->slug) }}" title="">
									                	<h2>{!! $post->title !!}</h2>
									                	</a>
									            </div>
									            <div class="g-row">
									                {!! str_limit($post->description) !!}
									            </div>
									        </div>
									    </div><!-- grid -->
									</li>
						        @endforeach
						        @else
						        <p>@lang('home.notsearch')</p>
						       	</ul>
			        		</div>
						@endif
				    	</div>
				    </div>

					<div class="news-more">
						{{ $posts->links() }}
					</div>
				</div> <!-- Content Left -->

				@include('widgets/_sidebar_small')<!-- Sidebar small Right -->
				
			</div>
        </div>

        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
        
    </div>
</div>

@endsection
