<?php
/**
 * Created by PhpStorm.
 * User: annguyen
 * Date: 2018-12-22
 * Time: 14:50
 */

namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class FlidiBaseModel extends Model{

    protected $connection = 'flidi';
    protected $guarded = ['id'];
}