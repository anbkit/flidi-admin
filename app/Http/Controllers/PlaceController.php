<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-14
 * Time: 19:45
 */

namespace App\Http\Controllers;


use App\Models\Location;

class PlaceController extends Controller
{
    /**
     * @param $place_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getPhotos($place_id){
        $place = Location::find($place_id);
        $items = [];
        if(!empty($place)){
            if(is_json($place['image'])){
                $tmp_images = json_decode($place['image'],true);
                foreach ($tmp_images as &$tmp_image){
                    $tmp_image = url('/').'/storage/'.$tmp_image;
                }
                $items = $tmp_images;
            }
            else{
                $items = array_wrap($place['image']);
            }
        }
        return response()->json([
            'items'=>$items
        ]);
    }

}