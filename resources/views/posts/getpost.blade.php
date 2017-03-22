@extends('layouts.app')

@section('content')
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
                            <div class="box-tag">
                                <div class="bt-left">
                                    <i class="icon20-tag"></i>
                                    Từ khoá:
                                </div>
                                <div class="bt-content">
                                    <a href="/" title="Facecar">Tag name</a>
                                </div>
                            </div>
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
@endsection
