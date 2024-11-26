<?php 
include_once "models/Category.php";
include_once "models/Product.php";
switch ($action) {
    case '':
        $categories=getCategories();
        $newProducts=getNewProducts();
        $yonexProducts=getYonex();
        $getMizu=getMizu();
        $liningProducts=getLining();
        $victorProducts=getVictor();
        include "views/index.php"; 
        break;    
}