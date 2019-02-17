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
use App\Models\Location;
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
            'location_id',
            'rating'
        ]);
        $inputs['image'] = json_encode($filesPath);
        $result = Blog::create($inputs);
        $this->updateStatistic($inputs['location_id']);
        return response()->json([
            'result'=>$result
        ]);
    }

    /**
     * @param $blog_id
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function update($blog_id,Request $request){
        $blog = Blog::find($blog_id);
        if(!$blog){
            return response()->json([
                'result'=>false
            ]);
        }
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
            'rating'
        ]);
        $inputs['image'] = json_encode($filesPath);
        $result = $blog->update($inputs);
        $this->updateStatistic($blog['location_id']);
        return response()->json([
            'result'=> $result
        ]);
    }


    public function updateStatistic($location_id){
        $blogs = Blog::where(['location_id'=>$location_id])->get();
        $total_blog = $blogs->count();
        $total_user = 0;
        foreach ($blogs as $blog){
            $users[$blog['user_id']] = $blog;
        }
        $total_user = count($users);
        $total_rating = 0;
        $rating = 0;
        foreach ($users as $user){
            $total_rating = $total_rating + $user['rating'];
        }
        if($total_user) {
            $rating = $total_rating / $total_user;
        }
        Location::where(['location_id'=>$location_id])->update([
            'total_user'=>$total_user,
            'rating'=>$rating,
            'total_blog'=>$total_blog
        ]);
    }

    /**
     * @param $location_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getList($location_id){
        $results = Blog::where(['location_id'=>$location_id])->orderBy('blog_id','desc')->with('user')->with('comments')->with('location')->with('likes')->get();
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
     * @param $user_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getListByUser($user_id){
        $results = Blog::where(['user_id'=>$user_id])->orderBy('blog_id','desc')->with('user')->with('comments')->with('likes')->with('location')->get();
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

    /**
     * @param $blog_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function delete($blog_id){
        $blog = Blog::find($blog_id);
        if($blog){
            $location_id = $blog['location_id'];
            $blog->comments()->delete();
            $blog->likes()->delete();
            $blog->delete();
            $this->updateStatistic($location_id);
        }
        return response()->json([
            'result'=>true
        ]);
    }
}