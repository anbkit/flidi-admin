<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-14
 * Time: 16:28
 */

namespace App\Models;


class Comment extends FlidiBaseModel{
    protected $table  = 'comments';
    protected $primaryKey = 'comment_id';

    public function user(){
        return $this->hasOne(WebUser::class,'user_id','user_id');
    }

}