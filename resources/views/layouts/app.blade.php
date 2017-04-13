<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    @yield('meta')

    <title>{{ config('app.name', 'N2News') }}</title>

    <!-- Styles -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript">
        var WebControl = {!! json_encode([
            'csrfToken'     => csrf_token(),
            'ajax_url'      => route('ajax'),
        ]) !!}
    </script>
    @yield('styles')
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="{{ asset('js/jquery-1.11.3.min.js') }}"></script>
</head>
<body> 
    <div class="navigator navigator-menu">
        <div class="container">
            <div class="header">
                <button type="button" class="expand-menu"><span class="em-bar"></span><span class="em-bar"></span><span class="em-bar"></span><span class="em-bar"></span></button>
                <button type="button" class="expand-search"><i class="icon30-search"></i></button>                
                <div class="logo">
                    <a href="/">
                        <img class="hidden-xs" src="/uploads/img/logo.png">
                        <img class="hidden visible-xs-inline" src="/uploads/img/logo-white.png">
                    </a>
                </div>
                <div class="box-search">
                    <div class="bs-inner">
                        <form action="{{ route('search') }}" method="POST">
                            {{ csrf_field() }}
                            <input name="keyword" id="input-search-main" class="form-control" type="text" placeholder="{{trans('home.search')}}" required>
                            <button type="submit" class="btn-search"><span class="glyphicon glyphicon-search"></span></button>
                        </form>
                    </div>
                </div>
                <div class="box-login">      
                <!-- Authentication Links -->
                @if (Auth::guest())
                    <a href="{{ route('login') }}">Đăng nhập</a>
                    <a href="{{ route('register') }}">Đăng ký</a>
                @else
                    <div class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            {{ Auth::user()->username }} <span class="caret"></span>
                        </a>

                        <ul class="dropdown-menu" role="menu">
                            <li><a href="{{ asset('user') }}">Trang cá nhân</a></li>
                            @if((Auth::user()->role) == 2)
                            <li><a href="{{ asset('admin') }}">Quản trị viên</a></li>
                            @endif
                            <li>
                                <a href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                    Đăng xuất
                                </a>

                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    {{ csrf_field() }}
                                </form>
                            </li>
                        </ul>
                    </div>
                @endif
                </div>
                <div class="menu-top">
                    <ul>
                        <li><a href="javascript:;" title="Hotline nội dung"><img src="/uploads/img/hotline_ict.png" alt="Hotline nội dung"></a></li>
                    </ul>
                </div>
            </div><!-- header -->
            <div class="menu" style="display: none;">
                @include('widgets.menu')
            </div>
            <div class="header-banner hidden-xs hidden-sm">
                @include('widgets._top_ads')
            </div>
        </div>
    </div>

    @yield('content')

    <div class="footer">
        <div class="container">
            <div class="footer-menu hidden-xs hidden-sm">
            </div><!-- footer-menu -->
            <div class="footer-col">
                <div class="row">
                    <div class="col-md-12">
                        <div class="footer-logo"><a href="/"><img src="/uploads/img/logo.png" alt="logo" style="height:66px"></a></div>
                    </div>
                    <div class="col-md-7 col-sm-6">
                        <div class="footer-content">
                            <p>N2NEWS - Chuyên trang về CNTT của Báo điện tử N2MAG.</p>
                            <p>Cơ quan chủ quản: <b>Tập Đoàn Công Nghệ N2 Vietnam.</b></p>      
                            <p>Tổng biên tập: Trần Hữu Thiện; Phó Tổng biên tập: Trần Hữu Thiên.</p>
                            <p class="hidden-lg hidden-md">Hotline nội dung: 0888 888 888 - Email: toasoan@n2news.vn</p>
                            <p>© Bản quyền thuộc N2NEWS.</p>
                        </div><!-- footer-content -->
                    </div><!-- col -->
                    <div class="col-md-5 col-sm-6 hidden-xs">
                        @include('widgets._pages_list')
                    </div>
                </div><!-- row -->
            </div><!-- footer-col -->
        </div><!-- container -->
    </div>

    <!-- Scripts -->
    <script src="{{ asset('js/scripts.js') }}"></script>
    @yield('scripts')

</body>
</html>
