<!DOCTYPE html>
<html lang="en">
<?php 
    require_once 'includes\db_conn.php';
    require_once 'includes\header.php'; ?>
<body>
    <!-- Navigation -->
    <?php require_once 'includes\navigation.php'; ?>

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <!-- Blog Entries Column -->
            <div class="col-md-8">
                <h1 class="page-header">
                    Page Heading
                    <small>Secondary Text</small>
                </h1>

                <!-- First Blog Post -->
                
                <?php
                    if(isset($_GET['post_id'])) {
                        $post_id = $_GET['post_id'];
                        
                        $update_view_count = "UPDATE posts SET post_views_count = post_views_count + 1 WHERE post_id=$post_id";
                        mysqli_query($connection, $update_view_count);
                    
                        $post_query = "SELECT * FROM posts WHERE post_id = $post_id";
                        $all_post = mysqli_query($connection, $post_query);
                        while($post = mysqli_fetch_assoc($all_post)) {
                            $post_id = $post["post_id"];
                            $post_category_id = $post["post_category_id"];
                            $post_title = $post["post_title"];
                            $post_author = $post["post_author"];
                            $post_date = $post["post_date"];
                            $post_image = $post["post_image"];
                            $post_content = $post["post_content"];
                            $post_tags = $post["post_tags"];
                            $post_comment_count = $post["post_comment_count"];
                            $post_status = $post["post_status"]; ?>
                        <h2><a href="#"><?php echo $post_title; ?></a></h2>
                        <p class="lead">
                            by <a href="index.php"><?php echo $post_author; ?></a>
                        </p>
                        <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo $post_date?></p>
                        <hr>
                        <img class="img-responsive" src="images/<?php echo $post_image; ?>" alt="">
                        <hr>
                        <p><?php echo $post_content; ?></p>
                        <hr>
                    <?php }
                    } else {
                        header("Location: index.php");
                    }?>
                
                <!-- Blog Comments -->
                <?php 
                    if(isset($_POST['submit_comment'])) {
                        $post_id = $_GET['post_id'];
                        $author = $_POST['comment_author'];
                        $email = $_POST['comment_author_email'];
                        $comment = $_POST['comment_content'];
                        
                        if(!empty($author) && !empty($email) && !empty($comment)) {
                            $query = "INSERT INTO comments (comment_post_id, comment_author, comment_email, comment_content, comment_status, comment_date) ";
                            $query .= "VALUES ($post_id, '{$author}', '{$email}', '{$comment}', 'unapproved', now()) ";

                            $added_comment = mysqli_query($connection, $query);
                            if(!$added_comment) {
                                die("Query Failed. ".mysqli_error($connection));
                            }

                            $query = "UPDATE posts SET post_comment_count = post_comment_count + 1 ";
                            $query .= "WHERE post_id=$post_id";
                            $count_updated = mysqli_query($connection, $query);
                        } else {
                            echo "<script>alert('Please field out the fields!');</script>";
                        }
                    }
                ?>

                <!-- Comments Form -->
                <div class="well">
                    <h4>Leave a Comment:</h4>
                    <form method="post" action="" role="form">
                        <div class="form-group">
                            <label for="Author">Author</label>
                            <input type="text" class="form-control" name="comment_author" required="" >
                        </div>
                        <div class="form-group">
                            <label for="Author_Email">Author Email</label>
                            <input type="email" class="form-control" name="comment_author_email" required="">
                        </div>
                        <div class="form-group">
                            <label for="comment">Your Comment</label>
                            <textarea name="comment_content" class="form-control" rows="3" required=""></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" name="submit_comment">Submit</button>
                    </form>
                </div>
                <hr>

               <!-- Posted Comments -->
               <?php
                    $comm_query = "SELECT * FROM comments WHERE comment_post_id = $post_id";
                    $comm_query .= " AND comment_status='Approved'";
                    $comm_query .= " ORDER BY comment_id DESC";
                    $comments = mysqli_query($connection, $comm_query);
                    while($comment = mysqli_fetch_assoc($comments)) { ?>
                        <!-- Comment -->
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="http://placehold.it/64x64" alt="">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading"><?php echo $comment['comment_author']; ?>
                                   <small><?php echo $comment['comment_date']; ?></small>
                                </h4>
                               <?php echo $comment['comment_content']; ?>
                            </div>
                        </div>
            <?php   } ?>
            </div>

            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">
                <?php require_once 'includes\sidebar.php'; ?>
            </div>
        </div>  <!-- /.row -->
        <hr>
        <!-- Footer -->
        <?php require_once 'includes\footer.php'; ?>
    </div>  <!-- /.container -->

    <script src="js/jquery.js"></script>    <!-- jQuery -->
    <script src="js/bootstrap.min.js"></script>     <!-- Bootstrap Core JavaScript -->
</body>
</html>
