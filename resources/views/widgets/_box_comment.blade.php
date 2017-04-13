<div class="box-comment">
    <div class="bc-title">
        <label>Ý kiến bạn đọc (<span class="comment-count">{!! $posts->cm_count !!}</span>):</label>
        <div class="pull-right">
            <a href="#" class="active comment-sort-by-newest">Mới nhất</a>
            {{--<a href="#" class="active comment-sort-by-like">Quan tâm nhất</a>--}}
        </div>
    </div><!-- bc-title -->
    <div class="bc-content">
        <!--comments item list-->
        @if(count($comments) > 0)
            @foreach($comments as $comment)
                @if($comment->parent_id == 0)
                    <div class="comment-item" id="{!! $comment->id !!}">
                        <div class="ci-row">{!! $comment->content !!}</div>
                        <div class="ci-row" id="cmt-{!! $comment->id !!}">
                            <span class="ci-name">{!! $comment->name !!}</span> - <span class="ci-time">{!! $comment->created_at !!}</span>
                            <div class="ci-button">
                                <a href="javascript:;" class="btn-cm btn-answer">
                                    <i class="fa fa-reply"></i> Trả lời
                                </a>
                            </div>
                        </div>
                        <div class="bc-input hidden">
                            <div class="form">
                                <div class="form-group">
                                    <textarea class="form-control txt-content" placeholder="Ý kiến của bạn..."></textarea>
                                    <label class="control-label help-block"><em></em></label>
                                </div>
                                <div class="form-group text-right" style="margin-bottom: 10px;">
                                    <button type="button" class="btn btn-default text-uppercase btn-close-comment">Đóng</button>
                                    <button type="button" class="btn btn-black text-uppercase btn-send-comment" parentid="{!! $comment->id !!}">Gửi</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    @foreach($comments as $item)
                        @if($item->parent_id == $comment->id)
                            <div class="ci-sub" parentid="{!! $item->parent_id !!}">
                                <div class="comment-item" id="{!! $item->id !!}">
                                    <div class="ci-row" id="cmt-{!! $item->id !!}">{!! $item->content !!}</div>
                                    <div class="ci-row">
                                        <span class="ci-name">{!! $item->name !!}</span> - <span class="ci-time">{!! $item->created_at !!}</span>
                                        {{--<div class="ci-button">
                                            <a class="btn-cm btn-like" href="#">Thích <span>0</span></a>
                                            <a class="btn-cm btn-share social-share" href="https://www.facebook.com/sharer/sharer.php?app_id=985220771513216&amp;u=http://ictnews.vn/the-gioi-so/thu-thuat/huong-dan-dung-grabtaxi-goi-taxi-123756.ict#cmt-36473" target="_blank" title="Chia sẻ facefook"><i class="fa fa-facebook"></i></a>
                                            <a class="btn-cm btn-share social-share" href="https://plus.google.com/share?url=http://ictnews.vn/the-gioi-so/thu-thuat/huong-dan-dung-grabtaxi-goi-taxi-123756.ict#cmt-36473" target="_blank" title="Chia sẻ google plus"><i class="fa fa-google-plus"></i></a>
                                        </div>  --}}
                                    </div>
                                </div>
                            </div>
                        @endif
                    @endforeach
                @endif
            @endforeach
        @endif
    </div><!-- bc-content -->
    <div class="no-comment {!! $posts->cm_count != 0 ? 'hidden' : '' !!}"><p class="small">Bài viết chưa có bình luận nào.</p></div>
    <div class="bc-more parent-load-more hidden"><a href="javascript:;" class="comment-load-more">Xem thêm bình luận</a></div>
    <div class="message hidden">
        <p class="small">
            Bình luận của bạn đã được gửi và sẽ hiển thị sau khi được duyệt bởi ban biên tập.
            <br>
            Ban biên tập giữ quyền biên tập nội dung bình luận để phù hợp với qui định nội dung của N2News.
        </p>
    </div>
    <div class="bc-input">
        @if(Auth::check())
            <div class="form">
                <div class="form-group">
                    <textarea class="form-control txt-content" placeholder="Ý kiến của bạn..."></textarea>
                    <label class="control-label help-block"><em></em></label>
                </div>
                <div class="form-group text-right" style="margin-bottom: 10px;">
                    <button type="button" class="btn btn-black text-uppercase btn-send-comment" parentid="0">Gửi</button>
                </div>
            </div>
        @else
            <div class="text-center">
                <p>{!! link_to_route('login', 'Đăng nhập') !!} để bình luận</p>
            </div>
        @endif
    </div>
</div>