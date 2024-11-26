<style>
/* Định dạng toàn trang */
#form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    width: 300px;
    min-height: 350px;
    margin: auto;
}
#form input[type="text"], form input[type="file"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
}

/* Định dạng nút */
#form button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1em;
    transition: background-color 0.3s;
}
#form button:hover {
    background-color: #218838;
}
h3 {
    color: #007bff;
    text-align: center;
    margin-top: 10px;
    font-size: 1.8em;
}
</style>
<?php include "views/layouts/header-admin.php" ?>
<h3>Sửa sản phẩm</h3>
<?php if (!isset($product) || !$product): ?>
    <p>Sản phẩm không tồn tại.</p>
    <a href="<?= $baseurl ?>/products">Quay lại danh sách sản phẩm</a>
<?php else: ?>
    <form action="<?= $baseurl ?>/updateproduct/<?= $product['id'] ?? "" ?>" method="post" enctype="multipart/form-data" id="form">
        <input type="text" name="title" placeholder="Title" value="<?= $product['title'] ?? "" ?>"> <br>
        <input type="number" name="price" placeholder="Price" value="<?= $product['price'] ?? "" ?>"> <br>
        <input type="number" name="sale" placeholder="Sale" value="<?= $product['sale'] ?? "" ?>"> <br>
        <textarea name="description" cols="30" rows="2"><?= $product['description'] ?? "" ?></textarea> <br>
        <input type="file" name="image" placeholder="Image"> <br>
        <?php if ($product['image']): ?>
            <img src="<?= $baseurl ?>/public/images/<?= $product['image'] ?>" alt="Image" width="100px"> <br>
        <?php endif; ?>
        <textarea name="detail" cols="30" rows="2"><?= $product['detail'] ?? "" ?></textarea> <br>
        <label for="status">Trạng thái:</label>
        <select name="status" id="status">
            <option value="1" <?= $product['status'] == 1 ? 'selected' : '' ?>>Hiển thị</option>
            <option value="0" <?= $product['status'] == 0 ? 'selected' : '' ?>>Ẩn</option>
        </select> <br>
        <select name="category">
            <?php foreach ($categories as $category) { ?>
                <option value="<?= $category['id'] ?>" <?= $product['category_id'] == $category['id'] ? "selected" : "" ?>>
                    <?= $category['name'] ?>
                </option>
            <?php } ?>
        </select> <br>
        <?php if (isset($errors)): ?>
            <ul style="color:red">
                <?php foreach ($errors as $error) {
                    echo "<li>$error</li>";
                } ?>
            </ul>
        <?php endif; ?>
        <input type="hidden" name="oldImage" value="<?= $product['image'] ?>">
        <button>Sửa</button>
    </form>
<?php endif; ?>
<?php include "views/layouts/footer-admin.php" ?>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        // Bắt sự kiện khi trạng thái sản phẩm thay đổi
        $(".toggle-status").change(function() {
            var status = $(this).is(":checked") ? 1 : 0;  // Lấy giá trị trạng thái (1 cho hiển thị, 0 cho ẩn)
            var productId = $(this).data('id');  // Lấy id sản phẩm từ thuộc tính data-id

            // Gửi yêu cầu AJAX để cập nhật trạng thái
            $.ajax({
                url: "<?= $baseurl ?>/update-status",  // Đường dẫn xử lý
                type: "POST",
                data: {
                    id: productId,  // ID sản phẩm
                    status: status  // Trạng thái mới
                },
                success: function(response) {
                    // Khi thành công, có thể hiển thị thông báo hoặc cập nhật trạng thái
                    if (response.success) {
                        alert("Cập nhật trạng thái thành công");
                    } else {
                        alert("Có lỗi xảy ra khi cập nhật trạng thái");
                    }
                },
                error: function() {
                    alert("Yêu cầu AJAX thất bại");
                }
            });
        });
    });
</script>

