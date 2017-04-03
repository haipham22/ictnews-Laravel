@extends('layouts.app')

@section('content')
<div class="container">
    <div class="bground">
        <div class="main">
			<div class="box col-md-12">
		        <div class="box-title">
		            <div class="lb-name">Tài khoản: {{ Auth::user()->username }}.</div>
		        </div>
		        <div class="box-content">
	                <div class="news-list">
	                	<ul class="list-group">
						    <li class="list-group-item">Họ Tên: {{ $user->fullname }}</li>
						    <li class="list-group-item">Tên tài khoản: {{ $user->username }}</li>
						    <li class="list-group-item">Email: {{ $user->email }}</li>
						    <li class="list-group-item">Sinh nhật: {{ $user->birthday }}</li>
						</ul>
					</div>
		    	</div>
		    </div>
		</div>
		<div class="sidebar">
            @include('widgets/_sidebar') <!-- Slide mews -->
        </div>
    </div>
</div>
@endsection
