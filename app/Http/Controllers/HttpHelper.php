<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use GuzzleHttp\Client;

class HttpHelper
{
	public static function httpCall($endpoint)
	{ 
        
		$client = new Client([
            'headers' => [
                'content-type' => 'application/x-www-form-urlencoded',
                
            ]
        ]);

        // return $form_params;
        
        

        $response = $client->request('GET', 'http://localhost:8080/api/'.$endpoint);
        
        $content = $response->getBody();
        // return $content;
        return json_decode($content, true);

    }

    public static function httpCallPost($endpoint, $form_params)
    { 
        
        $client = new Client([
            'headers' => [
                'content-type' => 'application/x-www-form-urlencoded',
                
            ]
        ]);

        // return $form_params;

        $response = $client->request('POST', 'http://localhost:8080/api/'.$endpoint, [
            'form_params' => $form_params
        ]);

        $content = $response->getBody();
        // return $content;
        return json_decode($content, true);

    }
}