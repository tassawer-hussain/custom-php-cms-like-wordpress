<?php add_user(); ?>
<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="u_firstname">First Name</label>
        <input type="text" class="form-control" name="u_firstname">
    </div>
    <div class="form-group">
        <label for="u_lastname">Last Name</label>
        <input type="text" class="form-control" name="u_lastname">
    </div>

    <div class="form-group">
        <label for="u_username">Username</label>
        <input type="text" class="form-control" name="u_username">
    </div>
    <div class="form-group">
        <label for="u_email">Email</label>
        <input type="email" class="form-control" name="u_email">
    </div>
    <div class="form-group">
        <label for="u_password">Password</label>
        <input type="text" class="form-control" name="u_password">
    </div>
    <div class="form-group">
        <label for="u_status">User Status</label>
        <select name="u_status" id="">
            <option value="Active">Active</option>
            <option value="Block">Block</option>
        </select>
    </div>
    <div class="form-group">
        <label for="u_role">User Role</label><br>
        <?php 
            $query = "SELECT * FROM roles";
            $cat_result = mysqli_query($connection, $query);
            while($row = mysqli_fetch_assoc($cat_result)) { 
                echo "<input type='checkbox' name='role[]' value='{$row['role_id']}'>   {$row['role_name']}<br>";
            }
        ?>
    </div>
    <div class="form-group">
        <label for="u_image">User Image</label>
        <input type="file" class="form-control" name="u_image">
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="add_user" value="Add User">
    </div>
</form>