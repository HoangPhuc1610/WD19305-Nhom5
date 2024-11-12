<?php include "views/layouts/header-admin.php"?>
<form action="searchCategory" method="post">
    <input type="text" name="search" value="<?= $_POST['search']??"" ?>"> <button>Search</button>
 </form>

<h3>Danh mục</h3>
<a href="<?=$baseurl ?>/addcategory">Thêm danh mục</a> <br>
<table class="table table-hover">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>image</th>
        <th>Action</th>
    </tr>
    <?php foreach ($categories as $category) {?>
        <tr>
            <td><?php echo $category['id']?></td>
            <td><?php echo $category['name']?></td>
            <td> <img src="public/images/<?=$category['image'] ?>" alt="" width=100px> </td>
            <td><a href="<?=$baseurl?>/editcategory/<?=$category['id']?>" class="btn btn-primary">Edit</a>
            <a href="<?=$baseurl?>/deletecategory/<?=$category['id']?>" onclick="return confirm('Bạn có thực sự muốn xóa?')" class="btn btn-danger">Delete</a></td>
        </tr>
    <?php }?>
</table>
<?php include "views/layouts/footer-admin.php"?>

