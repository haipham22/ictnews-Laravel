@extends('layouts.admin')

@section('title', trans('admin.ads.index'))

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
            <h3 class="box-title">@lang('admin.ads.index')</h3>
        </div>
        <div class="box-body">
            <table class="table table-striped" id="list">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>@lang('admin.ads.name')</th>
                        <th>@lang('admin.ads.status')</th>
                        <th>@lang('admin.ads.tool')</th>
                    </tr>
                </thead>
                <tbody>
                    @php($i = 0)
                    @foreach($ads as $ads)
                        @php($i++)
                        <tr>
                            <td>{!! $i !!}</td>
                            <td>{!! link_to_route('ads.edit', $ads->name, ['ads' => $ads->id]) !!}</td>
                            <td>
                                @if($ads->status == 1) Hiện @else Ẩn @endif
                            </td>
                            <td>
                                {!! link_to_route('ads.edit', 'Sửa', ['ads' => $ads->id], ['class' => 'btn btn-xs btn-info']) !!}
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection