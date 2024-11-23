<?php 
include "config.php";
session_start();
$baseurl="http://localhost/fstudio";
$action=$_GET['action']??"";
include "controllers/controller.php";