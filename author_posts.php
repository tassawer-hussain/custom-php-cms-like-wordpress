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
                    if(isset($_GET['author'])) {
                        $post_author = $_GET['author'];
                    }
                    $post_query = "SELECT * FROM posts WHERE post_author = '{$post_author}'";
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
                        by <?php echo $post_author; ?>
                    </p>
                    <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo $post_date?></p>
                    <hr>
                    <img class="img-responsive" src="images/<?php echo $post_image; ?>" alt="">
                    <hr>
                    <p><?php echo $post_content; ?></p>
                    <hr>
                    <?php } ?>
                
                <hr>
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
