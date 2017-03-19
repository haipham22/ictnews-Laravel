<ul>
    <li class="active">
        <a href="/" title="Trang chủ">
            <i class="fa fa-home hidden-sm hidden-xs"></i>
            <img class="icon" src="/uploads/img/menu-home.png">
            <span class="hidden-lg hidden-md">Trang chủ</span>
        </a>
    </li>
    @foreach($menuitems as $menu)
    <li class="li-submenu"><a href="{{ URL::route('categories.getCate',$menu->slug) }}">{{$menu->name}}</a></li>
    @endforeach
</ul>