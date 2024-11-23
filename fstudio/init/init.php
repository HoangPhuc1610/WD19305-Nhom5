<?php 
session_start();
require "Mailer/src/Exception.php";
require "Mailer/src/PHPMailer.php";
require "Mailer/src/SMTP.php";
require "models/m_sentmailer.php";

include "config.php";
$baseurl="http://localhost/fstudio";
$action=$_GET['action']??"";
include "controllers/controller.php";