<?php
$connection = new mysqli("localhost", "root", "", "coba");
$data = mysqli_query($connection, "SELECT * FROM barang WHERE id=" . $_GET['id']);
$data = mysqli_fetch_array($data, MYSQLI_ASSOC);
echo json_encode($data);
?>
