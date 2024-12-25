<?php
    $connection = new mysqli("localhost","root","","coba");
    $data = mysqli_query($connection, "select * from note_app
where id=".$_GET['id']);
    $data = mysqli_fetch_array($data, MYSQLI_ASSOC);
    echo json_encode($data);
?>