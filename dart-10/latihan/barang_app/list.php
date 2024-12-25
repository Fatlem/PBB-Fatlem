<?php
$connection = new mysqli("localhost", "root", "", "coba");
$data = mysqli_query($connection, "SELECT * FROM barang");
$data = mysqli_fetch_all($data, MYSQLI_ASSOC);
echo json_encode($data);
?>
