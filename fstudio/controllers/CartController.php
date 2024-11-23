<?php 
include_once "models/Product.php";
switch ($action) {
    case 'cart':
        include "views/cart/cart.php";
        break;
    case 'addtocart':
        $id=$_GET['id'];
        if(isset($_SESSION['cart'][$id])){
            $_SESSION['cart'][$id]['quantity']+=1;
        }else{
            $product=getProduct($id);
            $product['quantity']=1;
            $_SESSION['cart'][$id]=$product;           
        }    
        header("Location: $baseurl/cart");   
        break;
    case "pluscart":
        $id=$_GET['id'];
        $_SESSION['cart'][$id]['quantity']+=1;
        header("Location: $baseurl/cart");
        break;
    case "minuscart":
        $id=$_GET['id'];
        if($_SESSION['cart'][$id]['quantity']>1){
            $_SESSION['cart'][$id]['quantity']-=1;            
        }else{
            //$_SESSION['cart'][$id]['quantity']=1;
            unset($_SESSION['cart'][$id]);
        }        
        header("Location: $baseurl/cart");
        break;
    case "deletecart":
        $id=$_GET['id'];
        unset($_SESSION['cart'][$id]);
        header("Location: $baseurl/cart");
        break;
    case 'checkout': 
        $_SESSION['redirectto']=$_SERVER['REQUEST_URI'];
        if(!isset($_SESSION['login'])){
            header("Location: $baseurl/login");            
        } 
        include "views/cart/checkout.php";
        break;
}