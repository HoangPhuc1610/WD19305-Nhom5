<?php
include_once('views/layouts/header-admin.php');
include_once('init/config.php');
include 'models/Checkout.php';


// Lấy danh sách đơn hàng từ cơ sở dữ liệu
$orders = getAllOrders($conn);
$totalOrder = count($orders); 

// Lấy danh sách chi tiết đơn hàng và Lấy tên sản phẩm
$orderdetails = getAllOrdersdetails($conn);
$orderdetails = getAllOrdersDetailsWithProducts($conn);

// Lấy tổng số sản phẩm
$totalProducts = getTotalProducts($conn);

// Tính tổng doanh thu
$totalRevenue = getTotalRevenue($orders, $orderdetails);

// Định dạng tổng doanh thu
$formattedRevenue = number_format($totalRevenue, 0, ',', '.') . 'đ';

// Lấy tổng số hóa đơn
$totalOrder = getTotalOrder($conn);

// Lấy tổng số người dùng 
$totalUser = getTotalUser($conn); 

// Kiểm tra nếu có yêu cầu POST để cập nhật trạng thái
if (isset($_POST['update_status'])) {
    $order_id = $_POST['order_id'];
    $new_status = $_POST['status'];
    $query = "UPDATE orders SET status = :status WHERE id = :order_id ";
    $stmt = $conn->prepare($query);
    $stmt->bindParam(':status', $new_status, PDO::PARAM_INT);
    $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
    $stmt->execute();
    header("Location: " . $_SERVER['REQUEST_URI']);
    exit();
}

?>

<div class="row custom-row">
    <!-- Box Tổng Sản Phẩm -->
    <div class="col-md-3">
        <div class="card custom-card">
            <div class="card-header">Kho hàng</div>
            <div class="card-body">
                <h5 class="card-title"><?= isset($totalProducts) ? $totalProducts : 0 ?> Sản phẩm</h5>
            </div>
        </div>
    </div>

    <!-- Box Tổng người dùng -->
    <div class="col-md-3">
        <div class="card custom-card">
            <div class="card-header">Tổng người dùng</div>
            <div class="card-body">
                <h5 class="card-title"><?= isset($totalUser) ? $totalUser : 0 ?></h5>
            </div>
        </div>
    </div>

    <!-- Box Tổng Đơn Hàng -->
    <div class="col-md-3">
        <div class="card custom-card">
            <div class="card-header">Tổng đơn hàng</div>
            <div class="card-body">
                <h5 class="card-title"><?= isset($totalOrder) ? $totalOrder : 0 ?></h5>
            </div>
        </div>
    </div>

    <!-- Box Tổng Doanh Thu -->
    <div class="col-md-3">
        <div class="card custom-card">
            <div class="card-header">Tổng doanh thu</div>
            <div class="card-body">
                <h5 class="card-title"><?= $formattedRevenue ?> VNĐ</h5>
            </div>
        </div>
    </div>
</div>




<h1>Danh Sách Đơn Hàng</h1>
<form method="POST">
    <table border="1">
        <tr>
            <th>ID Đơn hàng</th>
            <th>Tên khách hàng</th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Ngày đặt</th>
            <th>Trạng thái</th>
        </tr>
        <?php foreach ($orders as $order) { ?>
            <?php
            // Lọc chi tiết đơn hàng tương ứng với order_id
            $orderDetailsForCurrentOrder = array_filter($orderdetails, function($orderdetail) use ($order) {
                return $orderdetail['order_id'] == $order['id'];
            });
            ?>
            <?php foreach ($orderDetailsForCurrentOrder as $orderdetail) : ?>
                <tr>
                    <td><?= $order['id']; ?></td>
                    <td><?= $order['customer']; ?></td>
                    <td><?= $orderdetail['title']; ?></td>
                    <td><?= $orderdetail['quantity']; ?></td>
                    <?php 
                    if ($orderdetail['quantity'] > 1) {
                        $total_price = number_format($orderdetail['price'] * $orderdetail['quantity'], 0, ',', '.');
                        echo "<td>{$total_price}đ</td>";
                    } else {
                        $price = number_format($orderdetail['price'], 0, ',', '.');
                        echo "<td>{$price}đ</td>";
                    }
                    ?>
                    <td><?= date('d-m-Y', strtotime($order['create_at'])); ?></td> <!-- Ngày đặt -->
                    <td>
                        <form method="POST">
                            <select name="status">
                                <option value="1" <?= $order['status'] == 1 ? 'selected' : ''; ?>>Đơn hàng đang xử lý</option>
                                <option value="2" <?= $order['status'] == 2 ? 'selected' : ''; ?>>Đơn hàng đang giao</option>
                                <option value="3" <?= $order['status'] == 3 ? 'selected' : ''; ?>>Đơn hàng đã được hủy</option>
                                <option value="4" <?= $order['status'] == 4 ? 'selected' : ''; ?>>Đơn hàng được thanh toán</option>
                            </select>
                            <input type="hidden" name="order_id" value="<?= $order['id']; ?>" />
                            <button type="submit" name="update_status">Cập nhật</button>
                        </form>
                    </td>
                </tr>
            <?php endforeach; ?>
        <?php } ?>
    </table>
</form>

<?php include "views/layouts/footer-admin.php" ?>
<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
}


h1 {
    text-align: center;
    color: #444;
    margin: 30px 0;
    font-size: 24px;
}


.custom-row {
    display: flex; 
    justify-content: space-between; 
    margin: 20px 0;
}

.custom-card {
    width: 100%; 
    border: 1px solid #ccc; 
    background-color: white; 
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    transition: transform 0.2s, box-shadow 0.2s;
}

.custom-card:hover {
    transform: translateY(-5px); 
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card-header {
    background-color: #4CAF50; 
    color: white; 
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    padding: 10px;
    text-transform: uppercase; 
    border-bottom: 1px solid #ccc; 
    width: 100%; 
}

.card-body {
    color: black;
    text-align: center; 
    font-size: 18px;
    font-weight: bold;
    display: flex;
    justify-content: center;
    align-items: center;
    height: calc(100% - 50px); 
    background-color: white; 
    border-radius: 0 0 8px 8px; 
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    background-color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}


th {
    background-color: #4CAF50;
    color: white;
    padding: 12px;
    text-align: left;
    font-size: 14px;
}

td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}


tr:hover {
    background-color: #f1f1f1;
}

td:first-child {
    font-weight: bold;
}

table, th, td {
    border: 1px solid #ddd;
}


td:hover {
    background-color: #e9e9e9;
}

form {
    display: flex;
    align-items: center;
    justify-content: flex-start;
}

select {
    padding: 8px;
    font-size: 14px;
    margin-right: 10px;
    border-radius: 4px;
    border: 1px solid #ddd;
}

button {
    padding: 8px 12px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
}

button:hover {
    background-color: #45a049;
}

</style>