<?php 
    if(isset($_POST['bulk_action'])){
        if(isset($_POST['bulk_option']) && isset($_POST['postBulkOperation'])) {
            global $connection;
            $operation = $_POST['bulk_option'];
            $list = $_POST['postBulkOperation'];
            switch ($operation) {
                case 'Publish':
                case 'Draft':
                    foreach ($list as $l){
                        $query = "UPDATE posts SET post_status='{$operation}' WHERE post_id=$l";
                        mysqli_query($connection, $query);
                    }
                    break;
                    
                case 'Delete':
                    foreach ($list as $l){
                        delete_post($l);
                    }
                    break;
                
                case 'Clone':
                    foreach ($list as $l){
                        $clone_post_query = "SELECT * FROM posts WHERE post_id = $l";
                        $clone_posts = mysqli_query($connection, $clone_post_query);
                        while ($row = mysqli_fetch_assoc($clone_posts)) {
                            $post_category_id = $row['post_category_id'];
                            $post_title = $row['post_title'];
                            $post_author = $row['post_author'];
                            $post_image = $row['post_image'];
                            $post_content = mysqli_real_escape_string($connection, $row['post_content']);
                            $post_tags = $row['post_tags'];
                            $post_status = $row['post_status'];
                            
                            $newimg = "clone_$post_image";
                            $img = "images/posts/$post_image";
                            $newimgloc = "images/posts/clone_$post_image";
                            copy($img, $newimgloc);
                            
                            $post_query = "INSERT INTO posts(post_category_id, post_title, post_author, post_date, post_image, post_content, post_tags, post_status) ";
                            $post_query .= "VALUES('{$post_category_id}','{$post_title}','{$post_author}',now(),'{$newimg}','{$post_content}','{$post_tags}','{$post_status}')";
                            $is_added_post = mysqli_query($connection, $post_query);
                            if(!$is_added_post) {
                                die("<b>Notification:</b> Query failed ". mysqli_error($connection));
                            }
                        }
                    }
                    break;
            }
        }
    }
?>

<form method="post" action="">
    <div class="row">
        <div id="bulk-option" class="col-xs-4">
            <select class="form-control" id="" name="bulk_option">
                <option value="">Select Option</option>
                <option value="Publish">Publish</option>
                <option value="Draft">Draft</option>
                <option value="Delete">Delete</option>
                <option value="Clone">Clone</option>
            </select>
        </div>
        <div class="col-xs-4">
            <input onClick="javascript: return confirm('Are you sure to do this action?');" type="submit" name="bulk_action" class="btn btn-success" value="Apply">
            <a class="btn btn-primary" href="posts.php?source=add_post">Add New</a>
        </div>
    </div>
    <table class="table table-hover">
        <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>Sr. #</th>
                <th>Author</th>
                <th>Title</th>
                <th>Category</th>
                <th>Status</th>
                <th>Image</th>
                <th>Tags</th>
                <th>Comments</th>
                <th>Date</th>
                <th>Views</th>
                <th colspan="2">Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php show_posts(); ?>
        
</form>


