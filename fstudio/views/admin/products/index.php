<style>
    /* Định dạng toàn trang */
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Định dạng tiêu đề và bảng */
h3 {
    color: #007bff;
    margin-top: 20px;
}

.table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
}

.table th, .table td {
    padding: 12px 15px;
    text-align: left;
}

.table tr th {
    background-color: #212529;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
}

.table tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table img {
    border-radius: 5px;
}

/* Định dạng nút */
/* button, .btn {
    cursor: pointer;
    padding: 8px 12px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    transition: background-color 0.3s;
} */

button {
    background-color: #007bff;
    color: #fff;
    border: none;
}

.btn-primary {
    background-color: #007bff;
    color: #fff;
    border: none;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.btn-danger {
    background-color: #dc3545;
    color: #fff;
    border: none;
}

.btn-danger:hover {
    background-color: #c82333;
}

input {
    padding: 4px;
    border-radius: 5px;
    border: 1px solid #ccc;
    width: 30%;
    margin-right: 5px;
}

/* Liên kết 'Thêm danh mục' */
a {
    color: #28a745;
    font-weight: bold;
    text-decoration: none;
}

a:hover {
    color: #dc3545;
}

</style>
<?php include "views/layouts/header-admin.php"?>
<!-- index.php -->
<h3>Sản phẩm</h3>
    <form action="searchProduct" method="post">
        <input type="text" name="search" placeholder="Tìm kiếm sản phẩm" value="<?= $_POST['search']??"" ?>"> <button>Search</button>
    </form>
<a href="<?= $baseurl?>/addproduct">Thêm sản phẩm</a>
<table class="table table-hover" border="1">
    <tr>
        <th>Id</th>
        <th>Image</th>
        <th>Title</th>
        <th>Price</th>
        <th>Category</th> 
        <th>Description</th> 
        <th>Trạng thái</th> 
        <th>Action</th>   
    </tr>
    <?php foreach ($products as $product) { ?>
    <tr>
        <td><?= $product['id'] ?></td>
        <td><img src="<?= $baseurl?>/public/images/<?= $product['image'] ?>" alt="" style="width: 150px; height: 200px"></td>
        <td><?= $product['title'] ?></td>
        <td><?= $product['price'] ?></td>
        <td><?= $product['category_id'] ?></td>
        <td><?= $product['description'] ?></td>
        <td><?= $product['status'] ?></td>
        <td><a href="<?= $baseurl?>/editproduct/<?= $product['id'] ?>" class="btn btn-primary">Edit</a> | <a href="<?= $baseurl?>/deleteproduct/<?= $product['id'] ?>" onclick="return confirm('Bạn có chắc muốn xóa?')" class="btn btn-danger">Delete</a></td>        
    </tr>
    <?php } ?>  
</table>
<?php include "views/layouts/footer-admin.php"?>
