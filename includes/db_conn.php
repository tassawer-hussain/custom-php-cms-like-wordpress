<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$database["db_host"] = "localhost";
$database["db_user"] = "root";
$database["db_password"] = "";
$database["db_name"] = "php_cms";

foreach($database as $key => $value) {
    define(strtoupper($key), $value);
}

$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);