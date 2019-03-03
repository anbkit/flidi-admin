<?php

namespace App\Http\Controllers;
function is_json($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;


    public function getSettings(){
        $settings = [
            'logo'=> url('/').'/storage/'+setting('site.logo'),
            'background'=> url('/').'/storage/'+setting('site.background')
        ];
        return response()->json($settings);
    }
}
