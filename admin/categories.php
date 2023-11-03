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
                            <small>Tassawer Hussain</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Blank Page
                            </li>
                        </ol>
                        <div class="col-xs-6">
                            <?php add_category(); ?>
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="category">Enter Category Name</label>
                                    <input type="text" class="form-control" name="category_title">
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-primary" name="add_category" value="Add Category">
                                </div>
                            </form>
                        </div>
                        
                        <?php edit_category(); ?>
                        <div class="col-xs-12">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Sr. #</th>
                                        <th>Category Name</th>
                                        <th colspan="2">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php show_categories(); ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <?php require_once 'includes/footer.php'; ?>

</body>

</html>
