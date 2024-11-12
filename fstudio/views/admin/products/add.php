<?php include "views/layouts/header-admin.php"?>
<h3>Thêm sản phẩm</h3>
<form action="postproduct" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="title" value="<?= $title ?? "" ?>"> <br>
    <input type="number" name="price" placeholder="price" value="<?= $price ?? "" ?>"> <br>
    <input type="number" name="sale" placeholder="sale" value="<?= $sale ?? "" ?>"> <br>
    <textarea name="description" id="" cols="30" rows=10>
        <?= $description ?? "" ?>
    </textarea> <br>
    <input type="file" name="image" placeholder="image"> <br>
    <textarea name="detail" id="" cols="30" rows=10>
        <?= $detail ?? "" ?>
    </textarea> <br>
    <select name="category" id="">
        <?php foreach ($categories as $category) { ?>
            <option value="<?= $category['id'] ?>" <?= $category == $category['id'] ? "selected" : "" ?>>
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
    <button>Add</button>
</form>
<?php include "views/layouts/footer-admin.php"?>