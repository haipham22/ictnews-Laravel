@foreach($categories as $category)
    @if(count($category->posts) > 0)
    <div class="col-md-6">
        <div class="box wrapper-list">
            <div class="box-title">
                <div class="lb-name">{{$category->name}}</div>
            </div>
            <div class="box wrapper-list">
                <div class="box-content">
                    <div class="news-list">
                        <ul>
                        @foreach($category->posts->sortBy('created_at') as $post)
                            @if ($loop->first)
                            <div class="news-big">
                                <div class="grid">
                                    <div class="img"><a href="{{ URL::route('posts.getPost',$post->slug) }}"><img src="{!! $post->thumbnail ? $post->thumbnail : url('/uploads/img/default-thumbnail.jpg') !!}"></a></div>
                                    <div class="g-content">
                                        <div class="g-row">
                                            <a class="g-title-white" href="{{ URL::route('posts.getPost',$post->slug) }}">{{$post->title}}</a>
                                        </div>
                                    </div>                            
                                </div><!-- grid -->
                            </div>
                            @else
                            <li>
                                <div class="grid">
                                    <div class="content">
                                        <div class="g-row">
                                            <a class="g-category" href="{{ URL::route('categories.getCate',$post->Categories->slug) }}"><i class="fa fa-list"></i> {!! $post->categories->name !!} - <i class="fa fa-clock-o"></i> {{ $post->created_at }}</a>
                                        </div>
                                        <div class="g-row">
                                            <a class="g-title" href="{{ URL::route('posts.getPost',$post->slug) }}">
                                                <h4>{{$post->title}}</h4>
                                            </a>
                                        </div>
                                    </div>
                                </div><!-- grid -->
                            </li>
                            @endif
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @endif
@endforeach