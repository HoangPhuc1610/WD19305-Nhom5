<?php 
// ProductController.php
include_once "models/Product.php";
include_once "models/Category.php";
switch($action){
    case "product":
        $products = getAllProducts();
        include "views/admin/products/index.php";
        break;
    case "addproduct":
        $categories = getCategories();
        include "views/admin/products/add.php";
        break;
    case "postproduct":
        $errors = [];
        $title=$_POST['title']??"";
        if($title == "") {
            array_push($errors, "Vui lòng nhập tên sản phẩm");
        }
        $price=$_POST['price']??"";
        if($price == "") {
            array_push($errors, "Vui lòng nhập giá");
        }
        $sale=$_POST['sale']??"";                
        $description=$_POST['description']??"";
        if($description == "") {
            array_push($errors, "Vui lòng nhập mô tả");
        }
        $detail=$_POST['detail']??"";
        if($detail == "") {
            array_push($errors, "Vui lòng nhập chi tiết sản phẩm");
        }
        $category=$_POST['category']??"";
        $image = $_FILES["image"]["name"]??"";
        $target_file = "public/images/$image";
        if ($image == "") {
            array_push($errors, "Ảnh không được để trống");
        } else {
            $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
            if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                && $imageFileType != "gif") {
                array_push($errors, "Ảnh không đúng định dạng");
            }
           
            if (file_exists($target_file)) {
                array_push($errors, "Tên ảnh đã tồn tại");                
            }
            if ($_FILES["image"]["size"] > 500000) {
                array_push($errors, "Kích thước ảnh quá lớn");
            }
        }
        $categories = getCategories();
        include "views/admin/products/add.php";
        if (count($errors) == 0) {      
            addProduct($title, $price, $sale, $image, $description, $detail, $category['id']);
            move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
            header("Location: $baseurl/product");
        }          
        break;
    case "editproduct":
        $id = $_GET['id'] ?? "";
        $product = getProduct($id);
        $categories = getCategories();
        include "views/admin/products/edit.php";
        break;    


    case "updateproduct":
        $errors = [];
        $title=$_POST['title']??"";
        if($title == "") {
            array_push($errors, "Vui lòng nhập tiêu đề");
        }        
        $price=$_POST['price']??"";
        if($price == "") {
            array_push($errors, "Vui lòng nhập giá");
        }
        $sale=$_POST['sale']??"";                
        $description=$_POST['description']??"";
        if($description == "") {
            array_push($errors, "Vui nhập mô tả");
        }
        $detail=$_POST['detail']??"";
        if($detail == "") {
            array_push($errors, "Vui nhập chi tiết");
        }
        $category=$_POST['category']??"";
        $image = $_FILES["image"]["name"]??"";
        $target_file = "public/images/$image";
        if ($image != "") {            
            $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
            if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"  
                && $imageFileType != "gif") {
                array_push($errors, "Ảnh không hợp lệ");
            }            
            if (file_exists($target_file)) {
                array_push($errors, "Ảnh đã tồn tại");                
            }
            if ($_FILES["image"]["size"] > 500000) {
                array_push($errors, "Kích thước ảnh quá lớn");
            }
        }  
        $id = $_GET['id'];
        $products = getAllProducts();
        include "views/admin/products/edit.php";
        if (count($errors) == 0) {
            if($image == "") {
                $oldImage=$_POST['oldImage'];
                updateProduct($id, $title, $price, $sale, $oldImage, $description, $detail, $category);
            } else {
                updateProduct($id, $title, $price, $sale, $image, $description, $detail, $category);
                move_uploaded_file($_FILES["image"]["tmp_name"], $target_file);
            }            
            header("Location: $baseurl/product");
        }  
        break;


    case "deleteproduct":
        $id = $_GET['id'] ?? "";
        deleteProduct($id);
        header("Location: $baseurl/product");
        break;
}
