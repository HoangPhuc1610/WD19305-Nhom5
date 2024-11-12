<?php 
function register($username, $email, $password){
    global $conn;
    $sql = "INSERT INTO users(username,email,password) VALUES(:username, :email, :password)";   
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email',$email);
    $stmt->bindParam(':password',$password);
    $stmt->execute();
    return $conn->lastInsertId();
}

function checkExistUser($username, $email){
    global $conn;
    $sql = "SELECT * FROM users WHERE username = :username OR email = :email";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':username', $username);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    $user = $stmt->fetch();
    return $user; 
}

function login($email, $password){
    global $conn;
    $sql = "SELECT id, username, email, role_id FROM users WHERE email = :email AND password = :password";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $password);
    $stmt->execute();
    $user = $stmt->fetch();
    return $user;
}