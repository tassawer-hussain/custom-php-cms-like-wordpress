<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php">CMS FRONT</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <?php if(isset($_SESSION['is_admin'])) {
                        echo "<li><a href='admin'>Admin</a></li>";
                        if(isset($_GET['post_id'])) {
                            echo "<li><a href='admin/posts.php?source=edit_post&edit-post-id={$_GET['post_id']}'>Edit Post</a></li>";
                        }
                    }
                
                    $query = "SELECT * FROM categories";
                    $categories = mysqli_query($connection, $query);
                    while($row = mysqli_fetch_assoc($categories)) {
                        $category = $row["cat_title"];
                        $category_id = $row["cat_id"];
                        echo "<li><a href='category.php?category=$category_id'>{$category}</a></li>";
                    }
                    echo "<li><a href='registration.php'>Registration</a></li>";                
                ?>
            </ul>
            
            <?php 
                if(isset($_SESSION['username'])) { ?>
                     <ul class="nav navbar-right top-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <?php echo $_SESSION['username']; ?> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="admin/includes/logout.php"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
             <?php  } ?>
           
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>