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
                        <?php                    
                           if(isset($_GET['source'])) {
                               $source = $_GET['source'];
                           } else {
                               $source = '';
                           }
                           switch($source) {
                               case 'add_user':
                                   require_once 'includes/add_user.php';
                                   break;
                               case 'edit_user';
                                   require_once 'includes/edit_user.php';
                                   break;
                               default:
                                   require_once 'includes/view_users.php';
                           }
                           
                           
                        ?>
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
