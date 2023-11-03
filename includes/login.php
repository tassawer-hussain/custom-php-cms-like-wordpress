<?php
require_once 'db_conn.php';
session_start();

if(isset($_POST['login'])) {
    $username = mysqli_real_escape_string($connection, $_POST['username']);
    $password = mysqli_real_escape_string($connection, $_POST['password']);
    
    $user_query = "SELECT * FROM users WHERE username = '{$username}'";
    $user_result = mysqli_query($connection, $user_query);
    
    if(!$user_result) {
        die("Query failed. ". mysqli_error($connection));
    }

    while ($row = mysqli_fetch_assoc($user_result)) {
        //$salt = '$2y$10$iusesomecrazystrings22';
        //$password = crypt($password, $salt);
        $password = password_verify($password, $row['user_password']); 
       
        if($password) {
            $_SESSION['u_id'] = $row['user_id'];
            $_SESSION['username'] = $row['username'];
            $_SESSION['u_fname'] = $row['user_firstname'];
            $_SESSION['u_lname'] = $row['user_lastname'];
            $_SESSION['u_status'] = $row['user_status'];
            $_SESSION['u_email'] = $row['user_email'];
            $role_query = "SELECT r.role_name FROM roles r, users_role u WHERE r.role_id=u.r_id AND u.u_id={$row['user_id']}";
            $role_result = mysqli_query($connection, $role_query);
            while($r = mysqli_fetch_assoc($role_result)) {
                $_SESSION['role'][] = $r['role_name'];
                if($r['role_name'] == "Admin") {
                    $_SESSION['is_admin'] = TRUE;
                }
            }    
        }
    }
    if(isset($_SESSION['is_admin'])) {
        header("Location: ../admin");
    } else {
        header("Location: ../index.php");
    }
    
}