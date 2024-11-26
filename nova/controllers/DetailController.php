<?php
// Bao gồm model chứa hàm getProduct
include_once "models/Product.php";

switch ($action) {
    case 'detail':
        // Lấy ID sản phẩm từ URL
            if(isset($_GET['id'])){
            $id = $_GET['id'];
            // Lấy sản phẩm từ cơ sở dữ liệu
            $product = getProduct($id);
            include "views/detail/detail.php";
            // Kiểm tra nếu sản phẩm tồn tại
            }
        break;

        case "plusdetail":
            $id=$_GET['id'];
            $_SESSION['detail'][$id]['quantity']+=1;
            header("Location: $baseurl/detail");
            break;
        case "minusdetail":
            $id=$_GET['id'];
            if($_SESSION['detail'][$id]['quantity']>1){
                $_SESSION['detail'][$id]['quantity']-=1;            
            }else{
                //$_SESSION['cart'][$id]['quantity']=1;
                unset($_SESSION['detail'][$id]);
            }        
            header("Location: $baseurl/detail");
            break;
        
    
}
