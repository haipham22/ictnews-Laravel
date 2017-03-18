<div class="container">
        <div class="ns-inner">
            <div class="ns-label">Mới nhất:</div>
            <div class="ns-content">
                <div class="marquee str_wrap" style="height: 23px;"><div class="str_move str_origin" style="left: -6495.25px;">
                    <ul>
                    @foreach($posts as $post)
                        <li>
                            <a href="{{ URL::route('posts.getPost',$post->slug) }}">{!! $post->title !!}</a>
                        </li>
                    @endforeach
                    </ul>
                </div></div>
            </div><!-- ns-content -->
        </div><!-- ns-inner -->
    </div><!-- container -->
</div>