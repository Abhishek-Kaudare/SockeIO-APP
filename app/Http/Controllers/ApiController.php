<?php

namespace App\Http\Controllers;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Client;
use Illuminate\Http\Request;

class ApiController extends Controller
{
   
    public function mySchemes()
    {
    	$mySchemes = HttpHelper::httpCall('mySchemesAPI');
        return $mySchemes;

	}

    public function staffdetailget()
    {
    	// return "hello";

		$evaluation = HttpHelper::httpCall('getallstaff');
		$roledata = array('1' => 'Professor', '2' => 'Lab Assistant', '3' => 'Department Purchase Officer', '4' => 'Principal', '5' => 'Overall Purchase Officer', '6' => 'Admin');
		return view('systemadmin.completeuserview')->with(array('users' => $evaluation, 'roledata' => $roledata));

	}



    public function usersave(Request $request)
    {
    	// return "hello";
    	$api_params = [
				'm_id' => $request->name,
                's_id' => $request->name
		];
    	$evaluation = HttpHelper::httpCallPost('users',$api_params);
		return view('systemadmin.dashboard')->with('usersdata',$evaluation);

    }
}