<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-07
 * Time: 21:51
 */


namespace App\Http\Controllers;
use App\Models\Blog;
use App\Models\Comment;
use App\Models\Like;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
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
        $results = Blog::where(['location_id'=>$location_id])->orderBy('blog_id','desc')->with('user')->with('comments')->with('likes')->get();
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


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function postComment($blog_id,Request $request){
        $inputs = $request->only([
            'detail',
            'user_id',
        ]);
        $inputs['blog_id'] = $blog_id;
        return response()->json([
            'result'=>Comment::create($inputs)
        ]);
    }

    /**
     * @param $blog_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getComments($blog_id){
        $results = Comment::where(['blog_id'=>$blog_id])->orderBy('comment_id','desc')->with('user')->get();
        return response()->json([
            'items'=>$results
        ]);
    }

    /**
     * @param $blog_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getLikes($blog_id){
        $results = Like::where(['blog_id'=>$blog_id])->orderBy('like_id','desc')->get();
        return response()->json([
            'items'=>$results
        ]);
    }

    /**
     * @param $blog_id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function like($blog_id,Request $request){
        $inputs = $request->only([
            'user_id',
        ]);
        $inputs['blog_id'] = $blog_id;
        return response()->json([
            'result'=>Like::create($inputs)
        ]);
    }


    /**
     * @param $blog_id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function unLike($blog_id,Request $request){
        $result = Like::where(['blog_id'=>$blog_id,'user_id'=>$request->input('user_id')])->delete();
        return response()->json([
            'result'=>$result
        ]);
    }
}