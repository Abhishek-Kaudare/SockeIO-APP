<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\General as GeneralResource;

class SchemeController extends Controller
{
    public function index(){

        $dataModel=[];
        $schemes = "hello";
 		$dataModel['data'] = $schemes;
        $dataModel['message'] = "Fetch Successful";
        $dataModel['error'] = false;
        return new GeneralResource($dataModel);


    }
}
