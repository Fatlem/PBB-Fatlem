<?php
$connection = new mysqli("localhost", "root", "", "coba");
$kdBrg = $_POST['kdBrg'];
$nmBrg = $_POST['nmBrg'];
$hrjBeli = $_POST['hrjBeli'];
$hrjJual = $_POST['hrjJual'];
$stok = $_POST['stok'];

$result = mysqli_query($connection, "INSERT INTO barang (kdBrg, nmBrg, hrjBeli, hrjJual, stok) VALUES ('$kdBrg', '$nmBrg', '$hrjBeli', '$hrjJual', '$stok')");
if ($result) {
    echo json_encode(['message' => 'Data input successfully']);
} else {
    echo json_encode(['message' => 'Data Failed to input']);
}
?>
