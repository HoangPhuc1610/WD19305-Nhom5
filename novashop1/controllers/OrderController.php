<?php
include_once "models/Order.php";
include_once 'init/config.php';  

switch ($action) {
    case "order":
        $orders = getAllOrders($conn);
        include "views/admin/orders/index.php"; 
        break;
       case "orderdetail":
        include "views/orderdetail/oderdetails.php"; 
        break;
    case "orderdetailAdmin":
        include "views/admin/orderdetail/index.php"; 
    break;    
}

?>