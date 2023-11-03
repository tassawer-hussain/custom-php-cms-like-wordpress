<?php
session_start();

$_SESSION['username'] = null;
$_SESSION['u_fname'] = null;
$_SESSION['u_lname'] = null;
$_SESSION['u_status'] = null;
$_SESSION['u_email'] = null;
$_SESSION['role'] = null;
$_SESSION['is_admin'] = null;


header("Location: ../../index.php");