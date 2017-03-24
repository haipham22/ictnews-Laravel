@extends('layouts.admin')

@section('content')
<section class="content">
  	<div class="row">
	    <div class="col-md-3 col-sm-6 col-xs-12">
		    <div class="info-box">
		        <span class="info-box-icon bg-aqua"><i class="ion ion-ios-compose"></i></span>
		        <div class="info-box-content">
		          	<span class="info-box-text">Bài viết</span>
		          	<span class="info-box-number">{!! count($posts) !!} <small>Bài viết</small></span>
		        </div>
		      </div>
		</div>
	    <div class="col-md-3 col-sm-6 col-xs-12">
		    <div class="info-box">
		        <span class="info-box-icon bg-red"><i class="ion ion-navicon-round"></i></span>
		        <div class="info-box-content">
		          	<span class="info-box-text">Chuyên mục</span>
		          	<span class="info-box-number">{!! count($categories) !!} <small>Chuyên mục</small></span>
		        </div>
		      </div>
		</div>
		<div class="col-md-3 col-sm-6 col-xs-12">
		    <div class="info-box">
		        <span class="info-box-icon bg-yellow"><i class="ion ion-ios-people-outline"></i></span>
		        <div class="info-box-content">
		          	<span class="info-box-text">Thành viên</span>
		          	<span class="info-box-number">{!! count($user) !!} <small>Thành viên</small></span>
		        </div>
		      </div>
		</div>
		<div class="col-md-3 col-sm-6 col-xs-12">
		    <div class="info-box">
		        <span class="info-box-icon bg-green"><i class="ion-ios-compose-outline"></i></span>
		        <div class="info-box-content">
		          	<span class="info-box-text">Bình luận</span>
		          	<span class="info-box-number">{!! count($comments) !!} <small>Bình luận</small></span>
		        </div>
		      </div>
		</div>
    </div>
</section>
@endsection