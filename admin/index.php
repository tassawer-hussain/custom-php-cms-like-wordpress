<!DOCTYPE html>
<html lang="en">
<?php require_once 'includes/header.php';?>
<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <?php require_once 'includes/left-sidebar.php'; ?>
        </nav>

        <div id="page-wrapper">
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Welcome to Admin Section
                            <small><?php echo "{$_SESSION['u_fname']} {$_SESSION['u_lname']}"?></small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Blank Page
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-file-text fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <?php $post_count_query = "SELECT * FROM posts"; ?>
                                        <?php $post_count = mysqli_query($connection, $post_count_query); ?>
                                        <?php $post_count = mysqli_num_rows($post_count); ?>
                                        <div class="huge"><?php echo $post_count; ?></div>
                                        <div>Posts</div>
                                    </div>
                                </div>
                            </div>
                            <a href="./posts.php"> <!-- ./ mean see in the same directory while ../ see outside the directory -->
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-comments fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <?php $comments_count_query = "SELECT * FROM comments"; ?>
                                        <?php $comments_count = mysqli_query($connection, $comments_count_query); ?>
                                        <?php $comment_count = mysqli_num_rows($comments_count); ?>
                                        <div class="huge"><?php echo $comment_count; ?></div>
                                        <div>Comments</div>
                                    </div>
                                </div>
                            </div>
                            <a href="./comments.php">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-user fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <?php $users_count_query = "SELECT * FROM users"; ?>
                                        <?php $users_count = mysqli_query($connection, $users_count_query); ?>
                                        <?php $user_count = mysqli_num_rows($users_count); ?>
                                        <div class="huge"><?php echo $user_count; ?></div>
                                        <div>Users</div>
                                    </div>
                                </div>
                            </div>
                            <a href="./users.php">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-list fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <?php $categories_count_query = "SELECT * FROM categories"; ?>
                                        <?php $categories_count = mysqli_query($connection, $categories_count_query); ?>
                                        <?php $category_count = mysqli_num_rows($categories_count); ?>
                                        <div class="huge"><?php echo $category_count; ?></div>
                                        <div>Categories</div>
                                    </div>
                                </div>
                            </div>
                            <a href="./categories.php">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                
                
                <div class="row">
                    <?php 
                    $query = "SELECT * FROM posts WHERE post_status='Publish' ";
                    $publish_post = mysqli_query($connection, $query);
                    $publish_post_count = mysqli_num_rows($publish_post);
                    
                    $query = "SELECT * FROM posts WHERE post_status='Draft' ";
                    $draft_post = mysqli_query($connection, $query);
                    $draft_post_count = mysqli_num_rows($draft_post);
                    
                    $query = "SELECT * FROM comments WHERE comment_status='Unapproved' ";
                    $unapproved_comments = mysqli_query($connection, $query);
                    $unapproved_comments_count = mysqli_num_rows($unapproved_comments);
                    
                    $query = "SELECT * FROM users WHERE user_status='Block'";
                    $block_user = mysqli_query($connection, $query);
                    $block_user_count = mysqli_num_rows($block_user);
                    
                    $chart_data = array( 
                        "All Posts" => $post_count,
                        "Publish Posts" => $publish_post_count,
                        "Draft Posts" => $draft_post_count,
                        "Comments" => $comment_count,
                        "Unapproved Comments" => $unapproved_comments_count,
                        "Users" => $user_count,
                        "Block Users" => $block_user_count,
                        "Categories" => $category_count
                        );
                    
                    ?>
                    <script type="text/javascript">
                        google.charts.load('current', {'packages':['bar']});
                        google.charts.setOnLoadCallback(drawChart);

                        function drawChart() {
                            var data = google.visualization.arrayToDataTable([
                                ['Data', 'Count'],
                                <?php
                                foreach($chart_data as $k => $v) {
                                    echo "['{$k}', {$v}],";
                                }
                                ?>
                            ]);

                            var options = {
                                chart: {
                                    title: '',
                                    subtitle: '',
                                }
                             };
                          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
                          chart.draw(data, options);
                        }
                    </script>
                      <div id="columnchart_material" style="margin: 25px 10px;width: auto; height: 500px;"></div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once 'includes/footer.php'; ?>

</body>

</html>
