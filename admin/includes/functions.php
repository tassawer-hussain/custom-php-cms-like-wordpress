<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function get_online_user_count () {
    global $connection;
    $time = time();
    $time_out_in_seconds = 60;
    $time_out = $time - $time_out_in_seconds;
    $online_users =  mysqli_query($connection, "SELECT * FROM users_online WHERE time > '$time_out'");
    return mysqli_num_rows($online_users);
}

function add_category() {
    global $connection;
    if(isset($_POST['add_category'])){
        $cat_title = $_POST['category_title'];
        if($cat_title=="" || empty($cat_title)){
            echo "Notification: Category title should not be empty.";
        } else {
            $insert_cat_query = "INSERT INTO categories (cat_title) VALUES ('{$cat_title}')";
            $is_added = mysqli_query($connection, $insert_cat_query);
            if($is_added) {
                echo "Notification: Category added.";
            } else {
                die("Query failed ". mysqli_error($connection));
            }
        }
    }
}

function edit_category() {
    global $connection;
    if(isset($_GET['edit-id'])) { 
        $update_cat_id = $_GET['edit-id'];
        $query_cat = "SELECT cat_title FROM categories WHERE cat_id = $update_cat_id";
        $update_cat_result = mysqli_query($connection, $query_cat);
        while($row = mysqli_fetch_assoc($update_cat_result)) {
            $title = $row['cat_title']; ?>
            <div class='col-xs-6'>                
        <?php   if(isset($_POST['update_category'])){
                    $cat_title = $_POST['update_category_title'];
                    if($cat_title=="" || empty($cat_title)){
                        echo "Notification: Category title should not be empty.";
                    } else {
                        $insert_cat_query = "UPDATE categories SET cat_title = ('{$cat_title}') WHERE cat_id = $update_cat_id";
                        $is_added = mysqli_query($connection, $insert_cat_query);
                        if($is_added) {
                            header("Location: categories.php");
                        } else {
                            die("Query failed ". mysqli_error($connection));
                        }
                    }
                }   ?>
                <form action="" method="post">
                    <div class="form-group">
                        <label for="category">Update Category Name</label>
                        <input type="text" class="form-control" name="update_category_title" value="<?php echo $title;?>">
                    </div>
                    <div class="form-group">
                        <input type="submit" class="btn btn-primary" name="update_category" value="Update Category">
                    </div>
                </form>
            </div>
<?php   }
    } 
}

function show_categories() {
    global $connection;
    $query = "SELECT * FROM categories";
    $cat_result = mysqli_query($connection, $query);
    $num = 1;
    while($row = mysqli_fetch_assoc($cat_result)) {
        echo "<tr>";
        echo "<td>$num</td>";
        echo "<td>{$row['cat_title']}</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to delete?');\" href='categories.php?delete-id={$row['cat_id']}'>Delete</a></td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to edit it?');\" href='categories.php?edit-id={$row['cat_id']}'>Edit</a></td>";
        echo "</tr>";
        $num++;
    }
    delete_categories();
}

function delete_categories() {
    global $connection;
    if(isset($_GET['delete-id'])) {
        $cat_del_id = $_GET['delete-id'];
        $query = "DELETE FROM categories WHERE cat_id = $cat_del_id";
        $is_deleted = mysqli_query($connection, $query);
        if($is_deleted) {
            echo "Notification: Category deleted.";
            header("Location: categories.php");
        }
    }
}

function show_posts() {
    global $connection;
    
    $post_count_query = "SELECT * FROM posts";
    $post_count_result = mysqli_query($connection, $post_count_query);
    $post_count = mysqli_num_rows($post_count_result);
    $post_per_page = 5;
    $number_of_pages = ceil($post_count/$post_per_page);
    $post_start = '';

    if(isset($_GET['page'])) {
        $page_no = $_GET['page'];
        if($page_no==1) {
            $post_start = 0;
        } else {
            $post_start = $page_no*$post_per_page - $post_per_page;
        }
    }

    if($post_start == '') {
        $post_start = 0;
        $page_no = 1;
    }
    
    $post_query = "SELECT * FROM posts WHERE post_status='Publish' ORDER BY post_id DESC LIMIT $post_start, $post_per_page";
    //$post_query = "SELECT * FROM posts ORDER BY post_id DESC";
    $all_posts = mysqli_query($connection, $post_query);
    $num = 1;
    while ($row = mysqli_fetch_assoc($all_posts)) {
        echo "<tr>";
        echo "<td><input type='checkbox' name='postBulkOperation[]' value='{$row['post_id']}' class='postBulkOperation'></td>";
        echo "<td>{$num}</td>";
        echo "<td>{$row['post_author']}</td>";
        echo "<td><a href='../post.php?post_id={$row['post_id']}'>{$row['post_title']}</a></td>";
        
        $category = "SELECT cat_title FROM categories WHERE cat_id = '{$row['post_category_id']}'";
        $cat_result = mysqli_query($connection, $category);
        while($cat_row = mysqli_fetch_assoc($cat_result)) {
            $title = $cat_row['cat_title']; 
            echo "<td>{$cat_row['cat_title']}</td>"; }
        echo "<td>{$row['post_status']}</td>";
        echo "<td><img src='images/posts/{$row['post_image']}' width='100px'></td>";
        echo "<td>{$row['post_tags']}</td>";
        echo "<td>{$row['post_comment_count']}</td>";
        echo "<td>{$row['post_date']}</td>";
        echo "<td>{$row['post_views_count']}</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to edit it?');\" href='posts.php?source=edit_post&edit-post-id={$row['post_id']}'>Edit</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to delete?');\" href='posts.php?delete-post-id={$row['post_id']}'>Delete</td>";
        echo "</tr>";
        $num++;
    }
    echo "</tbody>";
    echo "</table>";
    echo "<ul class='pager'>";
    for($i=1; $i<=$number_of_pages; $i++) {
        if($i==$page_no) {
            echo "<li><a class='active' href='posts.php?page={$i}'>{$i}</a></li>";
        } else {
            echo "<li><a href='posts.php?page={$i}'>{$i}</a></li>";
        }

    }
    echo "</ul>";
    if(isset($_GET['delete-post-id'])) {
        delete_post($_GET['delete-post-id']);
    }
}

function add_post() {
    global $connection;
    if(isset($_POST['add_post'])){
        $post_title = $_POST['post_title'];
        $post_category_id = $_POST['post_category_id'];
        $post_author = $_POST['post_author'];
        $post_status = $_POST['post_status'];
        $post_tags = $_POST['post_tags'];
        $post_content = mysqli_real_escape_string($connection, $_POST['post_content']);
        $post_date = date('d-m-y'); // when added into db, call now() function of MySQL
        $post_image_name = $_FILES['post_image']['name'];
        $post_image_tmp_loc = $_FILES['post_image']['tmp_name'];
        
        move_uploaded_file($post_image_tmp_loc, "images/posts/$post_image_name");
        
        $post_query = "INSERT INTO posts(post_category_id, post_title, post_author, post_date, post_image, post_content, post_tags, post_status) ";
        $post_query .= "VALUES('{$post_category_id}','{$post_title}','{$post_author}',now(),'{$post_image_name}','{$post_content}','{$post_tags}','{$post_status}')";
        $is_added_post = mysqli_query($connection, $post_query);
        if($is_added_post) {
            $post_id = mysqli_insert_id($connection);
            echo "<p class='bg-success'>Post created, click to view <a href='../post.php?post_id=$post_id'>created post</a> or <a href='posts.php?source=add_post'>add more posts</a></p>";
            //header("Location: posts.php");
        } else {
            die("<b>Notification:</b> Query failed ". mysqli_error($connection));
        }
//        To see the content of $_FILES
//        foreach ($post_image as $k => $v){            
//            print "img[\'$k\'] == $v <br>";
//        }
    }
}

function delete_post($id) {
    global $connection;
    $query = "SELECT post_image FROM posts WHERE post_id=$id";
    $post_img = mysqli_query($connection, $query);
    $post_del_query = "DELETE FROM posts WHERE post_id = $id";
    $is_deleted = mysqli_query($connection, $post_del_query);
    if($is_deleted) {    
        while($r = mysqli_fetch_assoc($post_img)) {
            $p_img = $r['post_image'];
            $del_img = "images/posts/$p_img";
            unlink($del_img);
        }
        $delete_comments = "DELETE FROM comments WHERE comment_post_id=$id";
        mysqli_query($connection, $delete_comments);
        header("Location: posts.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}

function show_comments() {
    global $connection;
    $comm_query = "SELECT * FROM comments ORDER BY comment_id DESC";
    $all_comments = mysqli_query($connection, $comm_query);
    $num = 1;
    while ($row = mysqli_fetch_assoc($all_comments)) {        
        echo "<tr>";
        echo "<td>{$num}</td>";
        echo "<td>{$row['comment_author']}</td>";
        echo "<td>{$row['comment_content']}</td>";
        echo "<td>{$row['comment_email']}</td>";
        echo "<td>{$row['comment_status']}</td>";
        
        $post_query = "SELECT * FROM posts WHERE post_id = {$row['comment_post_id']}";
        $post_row = mysqli_query($connection, $post_query);
        while($p_row = mysqli_fetch_assoc($post_row)) {
            # post.php is outside the admin, so first go out the admin, then find post.php 
            echo "<td><a href='../post.php?post_id={$p_row['post_id']}'>{$p_row['post_title']}</a></td>";
        }
        
        echo "<td>{$row['comment_date']}</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to approve it?');\" href='comments.php?approve-comment-id={$row['comment_id']}'>Approve</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to unapprove it?');\" href='comments.php?unapprove-comment-id={$row['comment_id']}'>Unapprove</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to delete?');\" href='comments.php?delete-comment-id={$row['comment_id']}'>Delete</td>";
        echo "</tr>";
        $num++;
    }
    if(isset($_GET['delete-comment-id'])) {
        delete_comment($_GET['delete-comment-id']);
    } else if(isset($_GET['approve-comment-id'])) {
        approve_comment($_GET['approve-comment-id']);
    } else if(isset($_GET['unapprove-comment-id'])) {
        unapprove_comment($_GET['unapprove-comment-id']);
    }
}

function approve_comment($id) {
    global $connection;
    $comm_approve = "UPDATE comments SET comment_status = 'Approved' WHERE comment_id = $id";
    $is_approve = mysqli_query($connection, $comm_approve);
    if($is_approve) {
        header("Location: comments.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}

function unapprove_comment($id) {
    global $connection;
    $comm_unapprove = "UPDATE comments SET comment_status = 'Unapproved' WHERE comment_id = $id";
    $is_unapprove = mysqli_query($connection, $comm_unapprove);
    if($is_unapprove) {
        header("Location: comments.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}

function delete_comment($id) {
    global $connection;
    $comm_del_query = "DELETE FROM comments WHERE comment_id = $id";
    $is_deleted = mysqli_query($connection, $comm_del_query);
    if($is_deleted) {
        header("Location: comments.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}


function show_users() {
    global $connection;
    $user_query = "SELECT * FROM users";
    $all_users = mysqli_query($connection, $user_query);
    $num = 1;
    while ($row = mysqli_fetch_assoc($all_users)) {        
        echo "<tr>";
        echo "<td>{$num}</td>";
        echo "<td>{$row['username']}</td>";
        echo "<td>{$row['user_firstname']}</td>";
        echo "<td>{$row['user_lastname']}</td>";
        echo "<td>{$row['user_email']}</td>";
        echo "<td><img src='images/users/{$row['user_image']}' width='80px' height='50px' alt='{$row['username']}'></td>";
        echo "<td>";
        $role_query = "SELECT r.role_name FROM roles r, users_role u WHERE r.role_id = u.r_id AND u.u_id = {$row['user_id']}";
        $role_row = mysqli_query($connection, $role_query);
        $number_of_role = mysqli_num_rows($role_row);
        if($number_of_role != 0) {
            while($r_row = mysqli_fetch_assoc($role_row)) { 
                echo "{$r_row['role_name']}, ";
            }
        } else {
            echo "No role assign yet";
        }
        echo "</td>";
        
        echo "<td>{$row['user_status']}</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to active this user?');\" href='users.php?active-user-id={$row['user_id']}'>Active</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to block this user?');\" href='users.php?block-user-id={$row['user_id']}'>Block</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to edit this user?');\" href='users.php?source=edit_user&edit-user-id={$row['user_id']}'>Edit</td>";
        echo "<td><a onClick=\"javascript: return confirm('Are you sure to delete this user?');\" href='users.php?delete-user-id={$row['user_id']}'>Delete</td>";
        echo "</tr>";
        $num++;
    }
    if(isset($_GET['delete-user-id'])) {
        delete_user($_GET['delete-user-id']);
    } else if(isset($_GET['active-user-id'])) {
        active_user($_GET['active-user-id']);
    } else if(isset($_GET['block-user-id'])) {
        block_user($_GET['block-user-id']);
    }
}

function active_user($id) {
    global $connection;
    $user_active = "UPDATE users SET user_status = 'Active' WHERE user_id = $id";
    $is_approve = mysqli_query($connection, $user_active);
    if($is_approve) {
        header("Location: users.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}

function block_user($id) {
    global $connection;
    $user_block = "UPDATE users SET user_status = 'Block' WHERE user_id = $id";
    $is_block = mysqli_query($connection, $user_block);
    if($is_block) {
        header("Location: users.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}

function delete_user($id) {
    global $connection;
    $u_img_query = "SELECT user_image FROM users WHERE user_id=$id";
    $u_img = mysqli_query($connection, $u_img_query);
    $user_del_query = "DELETE FROM users WHERE user_id = $id";
    $is_deleted = mysqli_query($connection, $user_del_query);
    if($is_deleted) {
        while($img = mysqli_fetch_assoc($u_img)) {
            unlink("images/users/{$img['user_image']}");
        }
        $delete_user_role = "DELETE FROM users_role WHERE u_id=$id";
        mysqli_query($connection, $delete_user_role);
        header("Location: users.php");
    } else {
        die("<b>Notification:</b> Query failed ". mysqli_error($connection));
    }
}


function add_user() {
    global $connection;
    if(isset($_POST['add_user'])){
        $u_username = $_POST['u_username'];
        $u_password = $_POST['u_password'];
        $u_firstname = $_POST['u_firstname'];
        $u_lastname = $_POST['u_lastname'];
        $u_email = $_POST['u_email'];
        $u_status = $_POST['u_status'];
        
        $u_password = password_hash($password, PASSWORD_BCRYPT, array('cost' => 12));
        
        $u_image_name = $_FILES['u_image']['name'];
        $u_image_tmp_loc = $_FILES['u_image']['tmp_name'];
        $img_name_in_db = $u_email.$u_image_name;
        $u_role = $_POST['role'];
        
        move_uploaded_file($u_image_tmp_loc, "images/users/$img_name_in_db");
       
        $user_query = "INSERT INTO users(username, user_password, user_firstname, user_lastname, user_email, user_image, user_status) ";
        $user_query .= "VALUES('{$u_username}', '{$u_password}', '{$u_firstname}', '{$u_lastname}', '{$u_email}', '{$img_name_in_db}', '{$u_status}')";
        //echo "<br><br>".$user_query;
        $is_added_user = mysqli_query($connection, $user_query);
        if($is_added_user) {
            $uid = $connection->insert_id;
            foreach($u_role as $role) {
                $query = "INSERT INTO users_role(u_id, r_id) VALUES($uid, $role)";
                mysqli_query($connection, $query);
            }
            header("Location: users.php");
        } else {
            die("<b>Notification:</b> Query failed ". mysqli_error($connection));
        }
//        To see the content of $_FILES
//        foreach ($post_image as $k => $v){            
//            print "img[\'$k\'] == $v <br>";
//        }
    }
}

