<?php add_post(); ?>

<form action="" method="post" enctype="multipart/form-data">
    <div class="form-group">
        <label for="post_title">Post Title</label>
        <input type="text" class="form-control" name="post_title">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Category </label>
        <select name="post_category_id" id="" class="form-control">
            <?php 
                $query = "SELECT * FROM categories";
                $cat_result = mysqli_query($connection, $query);
                while($row = mysqli_fetch_assoc($cat_result)) { 
                    echo "<option value='{$row['cat_id']}'>{$row['cat_title']}</option>"; 
                }
            ?>            
        </select>
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Author</label>
        <input type="text" class="form-control" name="post_author">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Status</label>
        <select name="post_status" id="" class="form-control">
            <option value="Publish">Publish</option>
            <option value="Draft">Draft</option>
        </select>
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Image</label>
        <input type="file" class="form-control" name="post_image">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Tags</label>
        <input type="text" class="form-control" name="post_tags">
    </div>
    <div class="form-group">
        <label for="post_category_id">Post Content</label>
        <textarea class="form-control" name="post_content" cols="30" rows="10"></textarea>
    </div>
    <div class="form-group">
        <input type="submit" class="btn btn-primary" name="add_post" value="Publish Post">
    </div>
</form>
