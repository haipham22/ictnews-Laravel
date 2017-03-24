@extends('layouts.app')

@section('scripts')
    <script type="text/javascript">
        var content = "",
            id = "",
            send = function () {
                $.ajax({
                    url: WebControl.ajax_url,
                    type: 'post',
                    data: {
                        _token: WebControl.csrfToken,
                        type: 'addComment',
                        content: $.trim(content).replace(/\r\n|\r|\n/g, "<br/>"),
                        parent: id,
                        id: $('#post_id').val(),
                    },
                    success: function (data) {
                        var t = $(".box-comment .message");
                        t.removeClass("hidden");
                        $("html, body").stop().animate({
                            scrollTop: t.offset().top - 10
                        }, 500, "swing", function () {});
                        $(".txt-content").val("");
                        $("#txtName").val("");
                        $("#txtEmail").val("");
                        $(".form-group").removeClass("has-error");
                        $(".comment-item").find(".bc-input").addClass("hidden");
                    }
                });
            };
        $(".box-comment").on("click", ".btn-send-comment", function () {
            var n = $(this).closest(".form").find(".txt-content:first");
            return (content = n.val(), id = $(this).attr("parentid"), content.length == 0) ? (n.closest(".form-group").addClass("has-error").find("em").html("Bạn chưa nhập nội dung ý kiến !"), !1) : content.length < 10 ? (n.closest(".form-group").addClass("has-error").find("em").html("Nội dung ý kiến quá ngắn !"), !1) : content.length > 1e3 ? (n.closest(".form-group").addClass("has-error").find("em").html("Nội dung ý kiến quá dài !"), !1) : (send(), !1)
        });
        $(".box-comment").on("click", ".btn-answer", function () {
            var n = $(this).closest(".comment-item").attr("id");
            return t = n,
                $(this).closest(".comment-item").find(".bc-input").removeClass("hidden"),
                !1
        });
        $(".box-comment").on("click", ".btn-close-comment", function () {
            return $(this).closest(".bc-input").addClass("hidden"),
                !1
        });
    </script>
@stop

@section('content')
<input type="hidden" name="post_id" id="post_id" value="{!! $posts->id !!}">
<div class="container">
    <div class="bground">
        <div class="news-scroll">
            <div class="main">
                <div class="bginner">
                    <div class="main-small">
                        <ol class="breadcrumb" itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb">
                            <li><a href="/">Trang chủ</a></li>
                            <li class="active">
                                <a itemprop="url" href="{{ URL::route('categories.getCate',$posts->Categories->slug) }}"><span itemprop="title">{{ $posts->Categories->name }}</span>
                                </a></li>
                            <li class="time">
                                <i class="fa fa-calendar"></i>{{ $posts->created_at }}  <i class="fa fa-user"></i>{{ $posts->user->username }}
                            </li>
                        </ol>
            			<div id="page-wraper" class="box-news">
            				<div class="news-title">
            					<h1>{{ $posts->title }}</h1>
            				</div>
            				<div class="news-desc">
                                <div class="n2news-lb2">N2News.vn</div>
                                {!! $posts->description !!}
                            </div>
                            <div class="maincontent">
                                <div class="content-detail">
            						{!! $posts->content !!}
                                </div>
                            </div>
                            <!-- <div class="box-tag">
                                <div class="bt-left">
                                    <i class="icon20-tag"></i>
                                    Từ khoá:
                                </div>
                                <div class="bt-content">
                                    <a href="/" title="Facecar">Tag name</a>
                                </div>
                            </div> -->
                            @include('widgets/_box_comment')
            			</div>
                    </div>
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
</div>

{{--<div id="modalComment" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Gửi ý kiến</h4>
            </div>
            <div class="modal-body">
                <div class="form">
                    <div class="form-group">
                        <input type="text" id="txtName" class="form-control" placeholder="Họ và tên..." />
                        <label class="control-label help-block" for="txtName">
                            <em></em>
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="txtEmail" class="form-control" placeholder="Email..." />
                        <label class="control-label help-block" for="txtEmail">
                            <em></em>
                        </label>
                    </div>
                    <div class="form-group">
                        <input type="text" id="txtPhone" class="form-control" placeholder="Điện thoại..." />
                        <label class="control-label help-block" for="txtPhone">
                            <em></em>
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                <button type="button" id="btnSendComment" class="btn btn-info">Gửi</button>
            </div>
        </div>
    </div>
</div>--}}

@endsection
