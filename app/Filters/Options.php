<?php

namespace App\Filters;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\Filters\FilterInterface;

class Options implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        header("Access-Control-Allow-Origin: http://localhost:5173");
        // header("Access-Control-Allow-Origin: https://knowledge.nubisub.site");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin,X-Requested-With, Content-Type, Accept, Access-Control-Requested-Method, Authorization, Token");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PATCH, PUT, DELETE");
        header("Access-Control-Allow-Credentials: true");

        $method = $_SERVER['REQUEST_METHOD'];
        if ($method == "OPTIONS") {
            die();
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        //
    }
}
