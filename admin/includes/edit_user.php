<?php 
    $user_image = '';
    $edit_id = '';
    $user_role = '';
    if(isset($_GET['edit-user-id'])){
        $edit_id = $_GET['edit-user-id'];

        global $connection;
        $edit_user_query = "SELECT * FROM users WHERE user_id = $edit_id";
        $edit_user = mysqli_query($connection, $edit_user_query);
        while ($row = mysqli_fetch_assoc($edit_user)) {
            $user_fname = $row['user_firstname'];
            $user_lname = $row['user_lastname'];
            $username = $row['username'];
            $user_email = $row['user_email'];
            $user_password = $row['user_password'];
            $user_status = $row['user_status'];
            $user_image = $row['user_image'];
            
            $user_role = array();
            $query = "SELECT * FROM users_role WHERE u_id=$edit_id";
            $roles = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($roles)) {
                $user_role[] = $row['r_id'];    // populate the array
            }
?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="u_firstname">First Name</label>
        <input type="text" class="form-control" name="u_firstname" value="<?php echo $user_fname; ?>">
    </div>
    <div class="form-group">
        <label for="u_lastname">Last Name</label>
        <input type="text" class="form-control" name="u_lastname" value="<?php echo $user_lname; ?>">
    </div>

    <div class="form-group">
        <label for="u_username">Username</label>
        <input type="text" class="form-control" name="u_username" value="<?php echo $username; ?>">
    </div>
    <div class="form-group">
        <label for="u_email">Email</label>
        <input type="email" class="form-control" name="u_email" value="<?php echo $user_email; ?>">
    </div>
    <div class="form-group">
        <label for="u_password">Password</label>
        <input type="text" class="form-control" name="u_password" value="<?php echo $user_password; ?>">
    </div>
    <div class="form-group">
        <label for="u_status">User Status</label>
        <select name="u_status" id="">
            <option value="Active" <?php if($user_status == "Active") echo "selected";?>>Active</option>
            <option value="Block" <?php if($user_status == "Block") echo "selected";?>>Block</option>
        </select>
    </div>
    <div class="form-group">
        <label for="u_role">User Role</label><br>
        <?php 
            $num = 0;
            $role_count = count($user_role);
            $query = "SELECT * FROM roles";
            $roles = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($roles)) { 
                echo "<input type='checkbox' name='role[]' value='{$row['role_id']}'";
                if ($role_count>$num && $user_role[$num] == $row['role_id']) {
                    echo "checked"; $num++;
                    
                }
                echo "> {$row['role_name']}<br>";
            }
        ?>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-xs-6">
                <label for="u_image">Updated User Image</label>
                <input type="file" class="form-control" name="u_image">
            </div>
            <div class="col-xs-6">
                <img src="images/users/<?php echo $user_image; ?>" width="200px" height="150px" alt="<?php echo $username?>">
            </div>
        </div>
    </div>
    
    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="update_user" value="Update User">
    </div>
</form>
        <?php }
    }
    
if(isset($_POST['update_user'])){
    $u_username = $_POST['u_username'];
    $u_password = $_POST['u_password'];
    $u_firstname = $_POST['u_firstname'];
    $u_lastname = $_POST['u_lastname'];
    $u_email = $_POST['u_email'];
    $u_status = $_POST['u_status'];
    $u_role = $_POST['role'];
    
    $salt = '$2y$10$iusesomecrazystrings22';
    $u_password = crypt($u_password, $salt);

    $u_image_name = $_FILES['u_image']['name'];
    $u_image_tmp_loc = $_FILES['u_image']['tmp_name'];
    $img_name_in_db = $u_email.$u_image_name;
    
    $update_query = "UPDATE users SET ";
    if(!empty($u_image_name)) {
        $delete_img = "images/users/$user_image";
        unlink($delete_img);
        move_uploaded_file($u_image_tmp_loc, "images/users/$img_name_in_db");
        $update_query .= "user_image = '{$img_name_in_db}', ";
    }
    
    $update_query .= "username = '{$u_username}', ";
    $update_query .= "user_password = '{$u_password}', ";
    $update_query .= "user_firstname = '{$u_firstname}', ";
    $update_query .= "user_lastname = '{$u_lastname}', ";
    $update_query .= "user_email = '{$u_email}', ";
    $update_query .= "user_status = '{$u_status}' ";
    $update_query .= "WHERE user_id = '$edit_id'";
    
    $is_updated_user = mysqli_query($connection, $update_query);
    $num = 0;
    if($is_updated_user) {
        foreach($user_role as $r) {
            $delete_role = "DELETE FROM users_role WHERE u_id=$edit_id AND r_id=$r";
            mysqli_query($connection, $delete_role);
        }
        foreach($u_role as $role) {
            $query = "INSERT INTO users_role(u_id, r_id) VALUES($edit_id, $role)";
            mysqli_query($connection, $query);
        }
        header("Location: users.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}


