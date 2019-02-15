<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-14
 * Time: 16:27
 */

namespace App\Models;


class Like extends FlidiBaseModel
{
    protected $table = 'likes';
    protected $primaryKey = 'like_id';

}