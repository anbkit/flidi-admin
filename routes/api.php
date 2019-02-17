<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/blog/create','BlogController@create');
Route::post('/blog/update/{blog_id}','BlogController@update')->where(['blog_id'=>'[0-9]+']);
Route::post('/blog/delete/{blog_id}','BlogController@delete')->where(['blog_id'=>'[0-9]+']);
Route::post('/comment/create/{blog_id}','BlogController@postComment')->where(['blog_id'=>'[0-9]+']);
Route::post('/blog/like/{blog_id}','BlogController@like')->where(['blog_id'=>'[0-9]+']);
Route::post('/blog/unlike/{blog_id}','BlogController@unlike')->where(['blog_id'=>'[0-9]+']);
Route::get('/blog/list/{location_id}','BlogController@getList')->where(['location_id'=>'[0-9]+']);
Route::get('/blog/posts/{user_id}','BlogController@getListByUser')->where(['user_id'=>'[0-9]+']);
Route::get('/blog/comments/{blog_id}','BlogController@getComments')->where(['blog_id'=>'[0-9]+']);
Route::get('/blog/likes/{blog_id}','BlogController@getLikes')->where(['blog_id'=>'[0-9]+']);
Route::get('/place/photos/{place_id}','Placecontroller@getPhotos')->where(['place_id'=>'[0-9]+']);