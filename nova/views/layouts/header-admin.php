<?php
if(!isset($_SESSION['login']) or $_SESSION['login']['role_id']!=1){
  $_SESSION['redirectto'] = $_SERVER['REQUEST_URI'];
  header("Location: $baseurl/login");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<?= $baseurl ?>/admin">Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mynavbar">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="<?= $baseurl ?>/category">Danh Mục</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="<?= $baseurl ?>/product">Sản phẩm</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">Link</a>
        </li>
      </ul>
      <form action="<?=$baseurl?>/logout" method="POST" class="d-flex" style="color: white">
        <?php if(isset($_SESSION['login'])){?>
            Chào <?php echo $_SESSION['login']['username'] ?> |
           <button type="submit" class="btn-danger">Đăng xuất</button>
        <?php }?>
      </form>
    </div>
  </div>
</nav>

<div class="container-fluid mt-3">
