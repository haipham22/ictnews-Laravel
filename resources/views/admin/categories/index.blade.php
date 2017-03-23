@extends('layouts.app')

@section('content')

<div class="news-scroll">

@include('widgets._header_news_list')

<div class="container">
    <div class="bground">
        <div class="main">
			<div class="row">
		       	<div class="col-md-8">
				    <div class="box wrapper-list">
				        <div class="box-title">
				            <div class="lb-name">CHUYÊN MỤC: {!! $categories->name !!}</div>
				        </div>
						<div class="box-content">
			                <div class="news-list">
			                @if(count($posts) > 0)
			                    <ul>
						       	@foreach($posts as $post)

							       	@if ($loop->first)
									<div class="news-big">
								        <div class="grid">
							                <div class="img">
							                	<a href="{{ URL::route('posts.getPost',$post->slug) }}">
							                		<img src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}">
							                	</a>
							                </div>
							                <div class="g-content">
							                    <div class="g-row">
							                        <a class="g-title-white" href="{{ URL::route('posts.getPost',$post->slug) }}">{!! $post->title !!}</a>
							                    </div>
							                </div>                            
							            </div><!-- grid -->
									</div>
									@else
			                        <li>
									    <div class="grid row">
									        <div class="col-md-4 hidden-xs hidden-sm">
									        	<a href="{{ URL::route('posts.getPost',$post->slug) }}" title="">
									        		<img class="img-responsive" src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}">
									        	</a>
									        </div>
									        <div class="col-md-8">
										        <div class="g-content">
										            <div class="g-row">
										                <a class="g-category" href="{{ URL::route('categories.getCate',$post->Categories->slug) }}"><i class="fa fa-list"></i> {!! $categories->name !!} - <i class="fa fa-clock-o"></i> {{ $post->created_at }}</a>
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
										    </div>
									    </div><!-- grid -->
									</li>
									@endif
						        @endforeach
						       	</ul>
						    @else

						    	<p>@lang('home.post.nopostcate')</p>

						    @endif
			        		</div>
				    	</div>
				    </div>

					<div class="news-more">
						{{ $posts->links() }}
					</div>
				</div> <!-- Content Left -->

				<div class="sidebar-small">
					@include('widgets/_sidebar_small')<!-- Sidebar small Right -->
				</div>
				
			</div>
        </div>

        <div class="sidebar">
        @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
        
    </div>
</div>

@endsection
