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
function is_json($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}
class BlogController extends Controller{

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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


    /**
     * @param $location_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getList($location_id){
        $results = Blog::where(['location_id'=>$location_id])->orderBy('blog_id','desc')->with('user')->get();
        $items = [];
        foreach ($results as $result){
            if(is_json($result['image'])){
                $tmp_images = json_decode($result['image'],true);
                foreach ($tmp_images as &$tmp_image){
                    $tmp_image = url('/').'/storage/'.$tmp_image;
                }
                $result['image'] = $tmp_images;
            }
            else{
                $result['image'] = array_wrap($result['image']);
            }
            $result['created_at_str'] = date('d-m-Y H:i',strtotime($result['created_at']));
            $items[] = $result;
        }
        return response()->json([
            'items'=>$items
        ]);
    }
}