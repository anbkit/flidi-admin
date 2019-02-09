<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2019-02-10
 * Time: 00:07
 */

namespace App\Models;


class Blog extends FlidiBaseModel{
    protected $table = 'blogs';
    public $primaryKey = 'blog_id';

}