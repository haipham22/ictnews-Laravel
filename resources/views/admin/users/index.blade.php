@extends('layouts.admin')

@section('title')Quản lý thành viên @endsection

@section('content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">Danh sách thành viên</h3>
    </div>

    <div class="box-body no-padding">
        <table class="table table-striped">
            <tbody><tr>
                  	<th style="width: 10px">#</th>
                  	<th>Họ và Tên</th>
                  	<th>Tên tài khoản</th>
                  	<th>Email</th>
                  	<th>Quyền</th>
                  	<th>Tham gia</th>
                  	<th>Công cụ</th>
                </tr>
                <?php $i=1 ?>
                @foreach($data as $item)
                <tr>
                  	<td>{{ $i++ }}.</td>
                  	<td>{{ $item->fullname }}</td>
                  	<td>{{ $item->username }}</td>
                  	<td>{{ $item->email }}</td>
                  	<td>@if($item->role == 2)<span class="badge bg-red">Quản trị viên</span>@else<span class="badge bg-blue">Thành viên</span>@endif</td>
                  	<td>{{ $item->created_at }}</td>
                  	<td>
                  		@if($item->role == 1)
                  		<a id="confirmadmin" href="{{ URL::route('admin.users.setadmin',$item->id) }}" type="button" class="btn btn-xs btn-info">Đặt làm admin</a>
                  		<a id="delete" href="{{ URL::route('admin.users.delete',$item->id) }}" type="button" class="btn btn-xs btn-warning">Xóa tài khoản</a>
                  		@endif
                  	</td>
                </tr>
                @endforeach
          	</tbody>
        </table>
    </div>
</div>
@endsection

@section('scripts')
<script>
    var deleter = {

        linkSelector : "a#delete",

        init: function() {
            $(this.linkSelector).on('click', {self:this}, this.handleClick);
        },

        handleClick: function(event) {
            event.preventDefault();

            var self = event.data.self;
            var link = $(this);

            swal({
                title: "Xóa tài khoản",
                text: "Xóa vĩnh viễn tài khoản này sẽ không thể khôi phục lại?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Xóa vĩnh viễn!",
                closeOnConfirm: true
            },
            function(isConfirm){
                if(isConfirm){
                    window.location = link.attr('href');
                }
                else{
                    swal("cancelled", "Category deletion Cancelled", "error");
                }
            });

        },
    };

    var confirmadmin = {

        linkSelector : "a#confirmadmin",

        init: function() {
            $(this.linkSelector).on('click', {self:this}, this.handleClick);
        },

        handleClick: function(event) {
            event.preventDefault();

            var self = event.data.self;
            var link = $(this);

            swal({
                title: "Đặt làm Admin",
                text: "Bạn có chắc chắn muốn đặt thành viên này làm Quản trị viên không?",
                type: "success",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Có, xác nhận!",
                closeOnConfirm: true
            },
            function(isConfirm){
                if(isConfirm){
                    window.location = link.attr('href');
                }
                else{
                    swal("cancelled", "Category deletion Cancelled", "error");
                }
            });

        },
    };

	confirmadmin.init();
    deleter.init();
</script><!--  Script Confirm Alert!!! -->
@endsection