<!DOCTYPE html>
<html lang="en">

<?php 
    require_once "includes/db_conn.php";
    require_once 'includes/header.php'; ?>
<body>
    <?php require_once 'includes/navigation.php'; 
        //$salt = '$2y$10$iusesomecrazystrings22';
        if(isset($_POST['register'])) {
            $username = $_POST['username'];
            $email = $_POST['email'];
            $password = $_POST['password']; 
            
            if(!empty($username) && !empty($email) && !empty($password)) {
                $username = mysqli_real_escape_string($connection, $username);
                $email = mysqli_real_escape_string($connection, $email);
                $password = mysqli_real_escape_string($connection, $password);
                $password = password_hash($password, PASSWORD_BCRYPT, array('cost' => 12));
                
                $reg_query = "INSERT INTO users (username, user_email, user_password, user_status)";
                $reg_query .= " VALUES('{$username}','{$email}','{$password}','Block')";
                $is_reg = mysqli_query($connection, $reg_query);
                
                if($is_reg) {
                    $u_id = mysqli_insert_id($connection);
                    if(isset($_POST['role'])) {
                        $roles = $_POST['role'];
                        foreach($roles as $role) {
                            $rol_query = "INSERT INTO users_role(u_id, r_id) VALUES('{$u_id}', '{$role}')";
                            mysqli_query($connection, $rol_query);
                        }
                    }
                    $message = "Your registration is submitted.";
                }
            } else {
                $message = "Please! fill up the form. All fields are necassary";
            }
        }
    ?>

        <div class="container">
            <section id="login">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-6 col-xs-offset-3">
                            <div class="form-wrap">
                                <h1>Register</h1>
                                <form action="registration.php" method="post" id="login-form" autocomplete="off">
                                    <h3 class="text-center"><?php if(isset($message)) { echo $message;}?></h3>
                                    <div class="form-group">
                                        <label for="username" class="sr-only">Username</label>
                                        <input type="text" name="username" id="username" class="form-control" placeholder="Enter Desired Username">
                                    </div>
                                    <div class="form-group">
                                        <label for="email" class="sr-only">Email</label>
                                        <input type="email" name="email" id="email" class="form-control" placeholder="somebody@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="sr-only">Password</label>
                                        <input type="password" name="password" id="key" class="form-control" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="u_role">User Role</label><br>
                                        <?php 
                                            $query = "SELECT * FROM roles WHERE role_name <> 'Admin'";
                                            $cat_result = mysqli_query($connection, $query);
                                            while($row = mysqli_fetch_assoc($cat_result)) { 
                                                echo "<input type='checkbox' name='role[]' value='{$row['role_id']}'>   {$row['role_name']}<br>";
                                            }
                                        ?>
                                    </div>
                                    <input type="submit" name="register" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Register">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <?php require_once 'includes/footer.php'; ?>
        </div>  <!-- /.container -->

    <script src="js/jquery.js"></script>    <!-- jQuery -->
    <script src="js/bootstrap.min.js"></script>     <!-- Bootstrap Core JavaScript -->
</body>
</html>
