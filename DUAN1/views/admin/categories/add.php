<?php include "views/layouts/header-admin.php"?>
<h3>Thêm danh mục</h3>
<form action="postcategory" method="post" enctype="multipart/form-data">
    <input type="text" name="name" value="<?= $name??"" ?>"> <br>
    <input type="file" name="image" value="<?= $image??"" ?>"> <br>
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
