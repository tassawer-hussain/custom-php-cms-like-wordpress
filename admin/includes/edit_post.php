<?php 
    if(isset($_POST['update_post'])) {
        if(isset($_GET['edit-post-id'])){
            $edit_id = $_GET['edit-post-id'];      
            $post_title = $_POST['post_title'];
            $post_category_id = $_POST['post_category_id'];
            $post_author = $_POST['post_author'];
            $post_status = $_POST['post_status'];
            $post_tags = $_POST['post_tags'];
            $post_content = $_POST['post_content'];
            $post_date = date('d-m-y'); // when added into db, call now() function of MySQL
            $post_image_name = $_FILES['post_image']['name'];
            $post_image_tmp_loc = $_FILES['post_image']['tmp_name'];
            
            $update_query = "UPDATE posts SET ";
            if(!empty($post_image_name)) {
                $delete_img = "images/posts/$post_image";
                unlink($delete_img);
                move_uploaded_file($post_image_tmp_loc, "images/posts/$post_image_name");
                $update_query .= "post_image = '{$post_image_name}', ";
            }
            $update_query .= "post_title = '{$post_title}', ";
            $update_query .= "post_category_id = '{$post_category_id}', ";
            $update_query .= "post_author = '{$post_author}', ";
            $update_query .= "post_date = now(), ";
            $update_query .= "post_content = '{$post_content}', ";
            $update_query .= "post_tags = '{$post_tags}', ";
            $update_query .= "post_status = '{$post_status}' ";
            $update_query .= "WHERE post_id = '$edit_id'";
            
            $is_updated = mysqli_query($connection, $update_query);
            if($is_updated) {
                echo "<p class='bg-success'>Post updated, click to view <a href='../post.php?post_id=$edit_id'>updated post</a> or <a href='posts.php'>edit more posts</a></p>";
                //header("Location: posts.php");
            }
        }
    }
    
    $post_image = '';
    if(isset($_GET['edit-post-id'])){
        $edit_id = $_GET['edit-post-id'];

        global $connection;
        $edit_post_query = "SELECT * FROM posts WHERE post_id = $edit_id";
        $edit_posts = mysqli_query($connection, $edit_post_query);
        while ($row = mysqli_fetch_assoc($edit_posts)) {
            $post_author = $row['post_author'];
            $post_title = $row['post_title'];
            $post_category_id = $row['post_category_id'];
            $post_status = $row['post_status'];
            $post_image = $row['post_image'];
            $post_tags = $row['post_tags'];
            $post_comment_count = $row['post_comment_count'];
            $post_content = $row['post_content'];
?>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="post_title">Post Title</label>
        <input value="<?php echo $post_title; ?>" type="text" class="form-control" name="post_title">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Category</label>
        <select name="post_category_id" id="">
            <?php 
                $query = "SELECT * FROM categories";
                $cat_result = mysqli_query($connection, $query);
                while($row = mysqli_fetch_assoc($cat_result)) { 
                    echo "<option value='{$row['cat_id']}'";
                    if($row['cat_id']==$post_category_id) echo "selected";
                    echo ">{$row['cat_title']}</option>"; 
                }
            ?>            
        </select>
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Author</label>
        <input value="<?php echo $post_author; ?>" type="text" class="form-control" name="post_author">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Status</label>
        <select name="post_status" id="">
            <option value="Publish" <?php if($post_status=="Publish") echo "selected"; ?>>Publish</option>
            <option value="Draft" <?php if($post_status=="Draft") echo "selected"; ?>>Draft</option>
        </select>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col-xs-6">
                <label for="post_category_id">Updated Post Image</label>
                <input type="file" class="form-control" name="post_image">
            </div>
            <div class="col-xs-6">
                <img src="images/posts/<?php echo $post_image; ?>" width="500px" height="100px" alt="<?php echo $post_title?>">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Tags</label>
        <input value="<?php echo $post_tags; ?>" type="text" class="form-control" name="post_tags">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Content</label>
        <textarea class="form-control" name="post_content" cols="30" rows="10"><?php echo $post_content; ?></textarea>
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="update_post" value="Update Post">
    </div>
</form>

<?php 
        }
    }