<?php
$connection = new mysqli("localhost", "root", "", "coba");
$kdBrg = $_POST['kdBrg'];
$nmBrg = $_POST['nmBrg'];
$hrjBeli = $_POST['hrjBeli'];
$hrjJual = $_POST['hrjJual'];
$stok = $_POST['stok'];
$id = $_POST['id'];

$result = mysqli_query($connection, "UPDATE barang SET kdBrg='$kdBrg', nmBrg='$nmBrg', hrjBeli='$hrjBeli', hrjJual='$hrjJual', stok='$stok' WHERE id='$id'");
if ($result) {
    echo json_encode(['message' => 'Data edit successfully']);
} else {
    echo json_encode(['message' => 'Data Failed to update']);
}
?>
