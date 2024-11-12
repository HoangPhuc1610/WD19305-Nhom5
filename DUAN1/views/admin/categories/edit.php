<?php include "views/layouts/header-admin.php"?>
<h3>Sửa danh mục</h3>
<form action="<?=$baseurl ?>/updatecategory/<?= $category['id'] ?>" method="post" enctype="multipart/form-data">
    <input type="text" name="name" value="<?= $category['name'] ?>"> <br>
    <input type="file" name="image"> <br>
    <img src="<?=$baseurl ?>/public/images/<?= $category['image'] ?>" alt="" width=100px> <br>
    <?php 
    if(isset($errors)): 
        echo "<ul style='color:red'>";
        foreach ($errors as $error) {
            echo "<li>$error</li>";
        }
        echo "</ul>";
    endif
    ?> 
    <input type="hidden" name="oldImage" value="<?= $category['image'] ?>">
    <button>Edit</button>
</form>
<?php include "views/layouts/footer-admin.php"?>
