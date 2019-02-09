<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-07
 * Time: 21:51
 */


namespace App\Http\Controllers;
use App\Models\Blog;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class BlogController extends Controller
{
    public function create(Request $request){
        $filesPath = [];
        $path = $request->get('type','blogs').'/'.date('FY').'/';
        $files = Arr::wrap($request->file('files'));
        foreach ($files as $file) {
            $filename =str_random(20);
            $file->storeAs(
                $path,
                $filename.'.'.$file->getClientOriginalExtension(),
                config('voyager.storage.disk', 'public')
            );

            array_push($filesPath,$path.$filename.'.'.$file->getClientOriginalExtension());
        }
        $inputs = $request->only([
            'blog_title',
            'description',
            'detail',
            'user_id',
            'location_id'
        ]);
        $inputs['image'] = json_encode($filesPath);
        return response()->json([
            'result'=>Blog::create($inputs)
        ]);
    }

}