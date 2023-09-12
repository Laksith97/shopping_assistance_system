<?php 

    include "connection.php";

    
    $name = $_POST['name'];
    $password = $_POST['password'];
    $email = $_POST['email'];

    $sql = "SELECT * FROM users WHERE Name = '".$name."' AND Password = '".$password."' AND Email = '".$email."'";

    $results = mysqli_query($connect, $sql);
    $count = mysqli_num_rows($results);

    if ($count == 1) {
        echo json_encode("Error");
    }
    else {
        $insert = "INSERT INTO users(Name, Password, Email)
                   VALUES('".$name."', '".$password."','".$email."')";
        $query = mysqli_query($connect, $insert);

        if ($query) {
            echo json_encode("Success");
        }
    }
    
    
?>