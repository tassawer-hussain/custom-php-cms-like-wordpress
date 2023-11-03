<!DOCTYPE html>
<html lang="en">
<?php 
    require_once 'includes\db_conn.php';
    require_once 'includes\header.php'; ?>
<body>
    <!-- Navigation -->
    <?php require_once 'includes\navigation.php'; ?>
    
    <?php 
        $session = session_id();
        $time = time();
        $time_out_in_seconds = 60;
        $time_out = $time - $time_out_in_seconds;
        $query = "SELECT * FROM users_online WHERE session = '$session'";
        $query_result = mysqli_query($connection, $query);
        $count = mysqli_num_rows($query_result);
        if($count == NULL) {
            mysqli_query($connection, "INSERT INTO users_online(session, time) VALUES('$session', '$time')");
        } else {
            mysqli_query($connection, "UPDATE users_online SET time = '$time' WHERE session = '$session'");
        }
    ?>

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
                    
                    $post_query = "SELECT * FROM posts WHERE post_status='Publish' LIMIT $post_start, $post_per_page";
                    $all_post = mysqli_query($connection, $post_query);
                    if(!$all_post) {
                        die("Query Faild ". mysqli_error($connection));
                    }
                    while($post = mysqli_fetch_assoc($all_post)) {
                        $post_id = $post["post_id"];
                        $post_category_id = $post["post_category_id"];
                        $post_title = $post["post_title"];
                        $post_author = $post["post_author"];
                        $post_date = $post["post_date"];
                        $post_image = $post["post_image"];
                        $post_content = substr($post["post_content"], 0, 150);
                        $post_tags = $post["post_tags"];
                        $post_comment_count = $post["post_comment_count"];
                        $post_status = $post["post_status"]; ?>
                <h2><a href="post.php?post_id=<?php echo $post_id; ?>"><?php echo $post_title; ?></a></h2>
                <p class="lead">
                    by <a href="author_posts.php?author=<?php echo $post_author; ?>"><?php echo $post_author; ?></a>
                </p>
                <p><span class="glyphicon glyphicon-time"></span> Posted on <?php echo $post_date?></p>
                <hr>
                <a href="post.php?post_id=<?php echo $post_id; ?>"> <img class="img-responsive" src="admin/images/posts/<?php echo $post_image; ?>" alt=""></a>
                <hr>
                <p><?php echo $post_content; ?></p>
                <a class="btn btn-primary" href="post.php?post_id=<?php echo $post_id; ?>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                <hr>
                <?php } ?>
                
                <ul class="pager">
                    <?php for($i=1; $i<=$number_of_pages; $i++) {
                        if($i==$page_no) {
                            echo "<li><a class='active' href='index.php?page={$i}'>{$i}</a></li>";
                        } else {
                            echo "<li><a href='index.php?page={$i}'>{$i}</a></li>";
                        }
                        
                    }?>
                </ul>
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
