<?php include "views/layouts/header-admin.php"?>
<!-- index.php -->
<h3>Sản phẩm</h3>
<a href="<?= $baseurl?>/addproduct">Thêm sản phẩm</a>
<table class="table table-hover">
    <tr>
        <th>Id</th>
        <th>Image</th>
        <th>Title</th>
        <th>Price</th>
        <th></th>  
    </tr>
    <?php foreach ($products as $product) { ?>
    <tr>
        <td><?= $product['id'] ?></td>
        <td><img src="<?= $baseurl?>/public/images/<?= $product['image'] ?>" alt="" style="width: 200px; height: 200px"></td>
        <td><?= $product['title'] ?></td>
        <td><?= $product['price'] ?></td>
        <td><a href="<?= $baseurl?>/editproduct/<?= $product['id'] ?>" class="btn btn-primary">Edit</a> | <a href="<?= $baseurl?>/deleteproduct/<?= $product['id'] ?>" onclick="return confirm('Bạn có chắc muốn xóa?')" class="btn btn-danger">Delete</a></td>        
    </tr>
    <?php } ?>  
</table>
<?php include "views/layouts/footer-admin.php"?>
