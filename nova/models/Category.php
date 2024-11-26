<?php 
function getCategories(){
    global $conn;
    $sql="select * from categories";
    $stmt=$conn->prepare($sql);
    $stmt->execute();
    $categories=$stmt->fetchAll(PDO::FETCH_ASSOC);
    return $categories;
}


function getCategory($id){
    global $conn;
    $sql = "SELECT * FROM categories WHERE id = :id";   
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
    $category = $stmt->fetch();
    return $category; 
}


function addCategory($name, $image){
    global $conn;
    $sql = "INSERT INTO categories(name,image) VALUES(:name, :image)";   
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':image',$image);
    $stmt->execute();
    return $conn->lastInsertId();
}


function updateCategory($id, $name, $image){
    global $conn;
    $sql = "UPDATE categories SET name = :name, image=:image WHERE id = :id";   
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':name', $name);
    $stmt->bindParam(':image',$image);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
}


function deleteCategory($id){
    global $conn;
    // Những danh mục đã có sản phẩm thì không xóa được cần xử lí thêm  
    // Có thể chuyển sản phẩm vào danh mục mặc định
    $sql= "update products set category_id = null where category_id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();

    $sql = "DELETE FROM categories WHERE id = :id";   
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    $stmt->execute();
}


function searchCategory($search) {
    global $conn;
    $sql = "SELECT * FROM categories WHERE name LIKE :search";
    $stmt = $conn->prepare($sql);
    $searchTerm = '%' . $search . '%';
    $stmt->bindParam(':search', $searchTerm);
    $stmt->execute();
    $categories = $stmt->fetchAll();
    return $categories;
}
