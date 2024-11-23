<?php 
include_once "models/User.php";
switch ($action) {
    case 'login':
        include "views/auth/login.php";
        break;
    case 'register':
        include "views/auth/register.php";
        break;   
    case 'postlogin':
        $errors=[];
        $email = $_POST['email']??"";
        if($email==""){
            array_push($errors,"Vui lòng nhập email");
        }
        $password = $_POST['password']??"";
        if($password==""){
            array_push($errors,"Vui lòng nhập password");
        }else {
            // Kiểm tra mật khẩu có chứa ít nhất 1 chữ hoa
            if (!preg_match('/[A-Z]/', $password)) {
                array_push($errors, "Password phải có ít nhất một chữ hoa");
            }
        
            // Kiểm tra mật khẩu có chứa ít nhất 1 số
            if (!preg_match('/[0-9]/', $password)) {
                array_push($errors, "Password phải có ít nhất một chữ số");
            }
        
            // Kiểm tra mật khẩu có chứa ít nhất 1 ký tự đặc biệt
            if (!preg_match('/[\W_]/', $password)) {
                array_push($errors, "Password phải có ít nhất một ký tự đặc biệt");
            }
        
            // Kiểm tra độ dài mật khẩu (tối thiểu 8 ký tự)
            if (strlen($password) < 8) {
                array_push($errors, "Password phải có ít nhất 8 ký tự");
            }
        }
        $password = md5($password);
        $user = login($email, $password);
        if(!$user){
            array_push($errors, "Email hoặc password không đúng");
        }
        include "views/auth/login.php";
        if($user && count($errors)==0){
            $_SESSION['login'] = $user; 
            if(isset($_SESSION['redirectto'])){
                header("Location: $_SESSION[redirectto]");
                unset($_SESSION['redirectto']);
            }else {
                header("Location: $baseurl");
            }   
        }
        break;
    case 'logout':
        unset($_SESSION['login']);
        header("Location: $baseurl");
        break;
    case "postregister":
        $errors=[];
        $username = $_POST['name']??"";
        if($username==""){
            array_push($errors,"Vui lòng nhập Username");
        }
        $email = $_POST['email']??"";
        if($email==""){
            array_push($errors,"Vui lòng nhập Email");
        }
        $password = $_POST['pass']??"";    
        if ($password == "") {
            array_push($errors, "Vui lòng nhập password");
        } else {
            // Các điều kiện kiểm tra mật khẩu
            if (!preg_match('/[A-Z]/', $password)) {
                array_push($errors, "Password phải có ít nhất một chữ hoa");
            }
            if (!preg_match('/[0-9]/', $password)) {
                array_push($errors, "Password phải có ít nhất một chữ số");
            }
            if (!preg_match('/[\W_]/', $password)) {
                array_push($errors, "Password phải có ít nhất một ký tự đặc biệt");
            }
            if (strlen($password) < 8) {
                array_push($errors, "Password phải có ít nhất 8 ký tự");
            }
        }
        $repeatPassword= $_POST['re_pass']??"";
        if ($repeatPassword == "") {
            array_push($errors, "Vui lòng nhập lại password");
        } elseif ($password != $repeatPassword) {
            array_push($errors, "Password nhập lại không đúng");
        }
        if(checkExistUser($username, $email)){
            array_push($errors,"Username hoặc Email đã tồn tại");
        }
        if(!str_contains($email,'@')){
            array_push($errors,"Email không đúng định dạng");
        }
        include "views/auth/register.php";
        if(count($errors)==0){
            $password = md5($password);
            register($username, $email, $password);
            header("Location: $baseurl/login");
        }
        break;
}