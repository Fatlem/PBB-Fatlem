<?php
$connection = new mysqli("localhost", "root", "", "coba");
$id = $_POST['id'];
$result = mysqli_query($connection, "DELETE FROM barang WHERE id='$id'");
if ($result) {
    echo json_encode(['message' => 'Data delete successfully']);
} else {
    echo json_encode(['message' => 'Data Failed to delete']);
}
?>
