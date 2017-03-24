<div class="box wrapper-topview">
    <div class="box-title">
        <div class="lb-name">Bài viết ngẫu nhiên</div>
    </div>
    <div class="box-content">
        <div class="news-topview">
        @foreach($posts as $post)
		    <div class="grid">
                <div class="img"><a href="{{ URL::route('posts.getPost',$post->slug) }}" title=""><img src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}"></a></div>
                <div class="g-content">
                    <div class="g-row">
                        <a class="g-category" href="{{ URL::route('categories.getCate',$post->Categories->slug) }}"><i class="fa fa-list"></i> {{ $post->categories->name }}</a>
                    </div>
                    <div class="g-row">
                        <a class="g-title" href="{{ URL::route('posts.getPost',$post->slug) }}" title="">{{ $post->title }}</a>
                    </div>
                </div>
            </div>
        @endforeach
		</div>
	</div>
</div>
<div class="box">
    @if($ads)
    {!! $ads->code !!}
    @endif
</div>
