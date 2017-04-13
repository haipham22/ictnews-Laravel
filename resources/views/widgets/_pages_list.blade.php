<div class="pull-right">
@foreach($pages as $page)
	<a href="{{ URL::route('pages.getPage',$page->slug) }}">{{ $page->name }}</a> / 
@endforeach
</div>
