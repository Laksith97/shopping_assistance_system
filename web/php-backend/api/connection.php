<?php



  $host = 'shopping-app-db.cmblrafd76se.eu-north-1.rds.amazonaws.com';
  $db   = 'shopping_app_db';
  $user = 'admin';
  $pass = 'SSASapp23';
  $charset = 'utf8mb4';

 

  $connect = mysqli_connect($host, $user, $pass, $db);

  if(!$connect)
  {
    echo json_encode("Connection Failed");
  }

?>

