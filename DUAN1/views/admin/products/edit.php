<?php include "views/layouts/header-admin.php"?>
<!-- edit.php -->
<h3>Sửa sản phẩm</h3>
<form action="<?= $baseurl?>/updateproduct/<?= $product['id'] ?? "" ?>" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="title" value="<?= $product['title'] ?? "" ?>"> <br>
    <input type="number" name="price" placeholder="price" value="<?= $product['price'] ?? "" ?>"> <br>
    <input type="number" name="sale" placeholder="sale" value="<?= $product['sale'] ?? "" ?>"> <br>
    <textarea name="description" id="" cols="30" rows=10><?= $product['description'] ?? "" ?>
    </textarea> <br>
    <input type="file" name="image" placeholder="image"> <br>
    <img src="<?= $baseurl?>/public/images/<?= $product['image'] ?? "" ?>" alt="" width=100px> <br>
    <textarea name="detail" id="" cols="30" rows=10><?= $product['detail'] ?? "" ?>
    </textarea> <br>
    <select name="category" id="">
        <?php foreach ($categories as $category) { ?>
            <option value="<?= $category['id'] ?>" <?= $product['category_id'] == $category['id'] ? "selected" : "" ?>>
                <?= $category['name'] ?>
            </option>
        <?php } ?>
    </select> <br>
    <?php
    if(isset($errors)):
        echo "<ul style='color:red'>";
        foreach ($errors as $error) {
            echo "<li>$error</li>";
        }
        echo "</ul>";
    endif
    ?>
     <input type="hidden" name="oldImage" value="<?= $product['image'] ?>">
    <button>Sửa</button>
</form>
<?php include "views/layouts/footer-admin.php"?>
