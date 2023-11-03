    <!-- Blog Search Well -->
    <div class="well">
        <h4>Blog Search</h4>
        <form action="search.php" method="post">
            <div class="input-group">
                <input name="search-string" type="text" class="form-control" placeholder="Search via tags">
                <span class="input-group-btn">
                    <button name="search" class="btn btn-default" type="submit">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </form><!-- Search form-->
        <!-- /.input-group -->
    </div>
    
    <!-- Login Form -->
    <div class="well">
        <h4>Login In</h4>
        <form action="includes/login.php" method="post">
            <div class="form-group">
                <input name="username" type="text" class="form-control" placeholder="Username">
            </div>
            <div class="input-group">
                <input name="password" type="password" class="form-control" placeholder="Password">
                <span class="input-group-btn">
                    <button name="login" class="btn btn-primary" type="submit">
                        Login in
                    </button>
                </span>
            </div>
        </form><!-- Search form-->
        <!-- /.input-group -->
    </div>

    <!-- Blog Categories Well -->
    <div class="well">
        <h4>Blog Categories</h4>
        <div class="row">
            <div class="col-lg-6">
                <ul class="list-unstyled">
                    <?php 
                        $post_query = "SELECT * from categories";
                        $query_result = mysqli_query($connection, $post_query);
                        while($row = mysqli_fetch_assoc($query_result)) {
                            echo "<li><a href='category.php?category={$row['cat_id']}'>{$row['cat_title']}</a>";
                        }
                    ?>
                </ul>
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-6">
                <ul class="list-unstyled">
                    <li><a href="#">Category Name</a>
                    </li>
                    <li><a href="#">Category Name</a>
                    </li>
                    <li><a href="#">Category Name</a>
                    </li>
                    <li><a href="#">Category Name</a>
                    </li>
                </ul>
            </div>
            <!-- /.col-lg-6 -->
        </div>
        <!-- /.row -->
    </div>

    <!-- Side Widget Well -->
    <div class="well">
        <h4>Side Widget Well</h4>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
    </div>