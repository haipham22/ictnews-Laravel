<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');

Auth::routes();

// Users CP
Route::group(['middleware' => 'auth'], function () {
	Route::group(['prefix'=>'user'], function(){
		Route::get('/', ['as'=>'user.getProfile','uses'=>'HomeController@getProfile']);
        Route::get('/{id}', ['as'=>'user.getProfileid','uses'=>'HomeController@getProfileid']);

    });
});

// Admin CP
Route::group(['middleware' => 'isroleadmin'], function () {
    Route::group(['prefix'=>'admin'], function(){
    	Route::get('/', ['as'=>'admin.getDashboard','uses'=>'Admin\DashboardController@index']);

    	Route::resource('categories', 'Admin\CategoriesController');
        Route::resource('comments', 'Admin\CommentsController');
        Route::post('comments/{id}/setstatus', ['as' => 'comments.setstatus', 'uses'=> 'Admin\CommentsController@setStatus']);

        Route::resource('posts', 'Admin\PostsController');
        Route::resource('users', 'Admin\UsersController');
        Route::resource('pages', 'Admin\PagesController');
        Route::resource('ads', 'Admin\AdsController');

    });
});
// Show not Admin
Route::get('unauthorized',function(){
	return view('errors.404');
});

// Login Socials Routes
Route::get('auth/{provider}', 'Auth\RegisterController@redirectToProvider');
Route::get('auth/{provider}/callback', 'Auth\RegisterController@handleProviderCallback');

Route::post('ajax', ['as' => 'ajax', 'uses' => 'PostsController@ajax']);

Route::post('/search', ['as'=>'search','uses'=>'HomeController@search']); //search

Route::get('/trang/{slug}', ['as'=>'pages.getPage','uses'=>'PagesController@index']); //show a pages
Route::get('/tin-moi', ['as'=>'posts.newslist','uses'=>'PostsController@index']);
Route::get('/{slug}', ['as'=>'posts.getPost','uses'=>'PostsController@getPost']); //show a pages
Route::get('/c/{slug}', ['as'=>'categories.getCate','uses'=>'CategoriesController@index']); //show a categories

View::composer('widgets.menu', function($view){
    $view->with('menuitems', 
        App\Categories::where('add_to_menu','=','1')
                    ->orderBy('order','ASC')
                    ->get());
});

View::composer('widgets._sidebar_small', function($view){
    $view->with('posts', 
        App\Posts::where('status','=','1')
                    ->limit(5)
                    ->get());
    $view->with('ads', 
        App\Ads::where('status','=','1')
                    ->where('id','=','3')
                    ->first());
});

View::composer('widgets._header_news_list', function($view){
    $view->with('posts', 
        App\Posts::where('status','=','1')
                    ->orderBy('created_at','DESC')
                    ->limit(20)
                    ->get());
});
View::composer('widgets._top_ads', function($view){
    $view->with('ads', 
        App\Ads::where('status','=','1')
                    ->where('id','=','1')
                    ->first());
});
View::composer('widgets._sidebar', function($view){
    $view->with('ads', 
        App\Ads::where('status','=','1')
                    ->where('id','=','2')
                    ->first());
});