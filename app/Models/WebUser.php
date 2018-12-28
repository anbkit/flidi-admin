<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2018-12-28
 * Time: 15:10
 */

namespace App\Models;


class WebUser extends FlidiBaseModel
{
    protected $table = 'web_users';
    public $primaryKey = 'user_id';

}