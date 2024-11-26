<?php 
include "config.php";
session_start();
$baseurl="http://localhost:8000/nova";
$action=$_GET['action']??"";
include "controllers/controller.php";