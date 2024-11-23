<?php 
include_once "models/Category.php";
include_once "models/Product.php";
switch ($action) {
    case '':
        $categories=getCategories();
        $newProducts=getNewProducts();
        $viewProducts=getViewProducts();
        include "views/index.php"; 
        break;    
}