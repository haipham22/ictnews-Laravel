@extends('layouts.admin')

@section('title')Quản lý Trang @endsection

@section('styles')
    {!! Html::style('plugins/datatables/dataTables.bootstrap.css') !!}
@endsection

@section('scripts')
    {!! Html::script('plugins/datatables/jquery.dataTables.min.js') !!}
    {!! Html::script('plugins/datatables/dataTables.bootstrap.min.js') !!}
@endsection

@section('content')
<div class="box">
    <div class="box-header">
        <h3 class="box-title">Danh sách trang</h3>
    </div>
    <div class="box-body">
        <table class="table table-striped" id="list">
            <tbody>
                <tr>
                  	<th style="width: 10px">#</th>
                    <th>Tên trang</th>
                  	<th>Đường dẫn</th>
                    <th>Ngày tạo</th>
                  	<th>Công cụ</th>
                </tr>
                @php($i = 0)
                @foreach($data as $item)
                @php($i++)
                <tr>
                  	<td>{!! $i !!}.</td>
                    <td>{!! link_to_route('pages.edit', $item->name, ['item' => $item->id]) !!}</td>
                    <td>{{ $item->slug }}</td>
                  	<td>{{ $item->created_at }}</td>
                    <td>
                        {!! link_to_route('pages.edit', 'Sửa', ['item' => $item->id], ['class' => 'btn btn-xs btn-xs btn-info']) !!}
                        {!! link_to_route('pages.destroy', 'Xóa', ['item' => $item->id], ['class' => 'delete btn btn-xs btn-danger']) !!}
                    </td>
                </tr>
                @endforeach
          	</tbody>
        </table>
    </div>
</div>
@endsection
