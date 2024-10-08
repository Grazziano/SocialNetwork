<?php
/*
ini_set('display_errors',1);
ini_set('display_startup_erros',1);
error_reporting(E_ALL);

error_reporting(0);
ini_set("display_errors", 0);
*/

require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");
include("includes/classes/Notification.php");

if (isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SwirlFeed!</title>

    <!-- Javascript -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/swirlFeed.js"></script>
    <script src="assets/js/jquery.Jcrop.js"></script>
    <script src="assets/js/jcrop_bits.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/jquery.Jcrop.css">

</head>

<body>
    <div class="top_bar">
        <div class="logo">
            <a href="index.php">SwirlFeed</a>
        </div>

        <div class="search">
            <form action="search.php" method="get" name="search_form">
                <input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn ?>')" name="q" placeholder="Search..." autocomplete="off" id="search_text_input">
                <div class="button_holder">
                    <img src="assets/images/icons/iconfinder_Search-icon_88602.png" alt="">
                </div>
            </form>

            <div class="search_results">
            </div>

            <div class="search_results_footer_empty">
            </div>
        </div>

        <nav>
            <?php
            # Unread messages
            $messages = new Message($con, $userLoggedIn);
            $num_messages = $messages->getUnreadNumber();

            # Unread notifications
            $notifications = new Notification($con, $userLoggedIn);
            $num_notifications = $notifications->getUnreadNumber();

            # Unread notifications
            $user_obj = new User($con, $userLoggedIn);
            $num_requests = $user_obj->getNumberOfFriendRequests();

            ?>
            <a href="<?php echo $userLoggedIn ?>"><?php echo $user['first_name'] ?></i></a>
            <a href="index.php"><i class="fas fa-home fa-lg"></i></a>
            <a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'message')">
                <i class="fas fa-envelope fa-lg"></i>
                <?php
                if ($num_messages > 0) {
                    echo "<span class='notification_badge' id='unread_message'>" . $num_messages . "</span>";
                }
                ?>
            </a>
            <a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'notification')">
                <i class="fas fa-bell fa-lg"></i>
                <?php
                if ($num_notifications > 0) {
                    echo "<span class='notification_badge' id='unread_notification'>" . $num_notifications . "</span>";
                }
                ?>
            </a>
            <a href="requests.php">
                <i class="fas fa-users fa-lg"></i>
                <?php
                if ($num_requests > 0) {
                    echo "<span class='notification_badge' id='unread_requests'>" . $num_requests . "</span>";
                }
                ?>
            </a>
            <a href="settings.php"><i class="fas fa-cog fa-lg"></i></a>
            <a href="includes/handlers/logout.php"><i class="fas fa-sign-out-alt fa-lg"></i></a>
        </nav>

        <div class="dropdown_data_window" style="height: 0px; border: none;">
            <input type="hidden" id="dropdown_data_type" value="">
        </div>
    </div>

    <script>
        var userLoggedIn = '<?php echo $userLoggedIn; ?>';

        $(document).ready(function() {

            $('.dropdown_data_window').scroll(function() {
                var inner_height = $('.dropdown_data_window').innerHeight(); //Div containing data
                var scroll_top = $('.dropdown_data_window').scrollTop();
                var page = $('.dropdown_data_window').find('.nextPageDropdownData').val();
                var noMoreData = $('.dropdown_data_window').find('.noMoreDropdownData').val();

                if ((scroll_top + inner_height >= $('.dropdown_data_window')[0].scrollHeight) && noMoreData == 'false') {

                    var pageName; // Holds name of page to send ajax request to
                    var type = $('#dropdown_data_type').val();

                    if (type == 'notification') {
                        pageName = "ajax_load_notification.php";
                    } else if (type == 'message') {
                        pageName = "ajax_load_messages.php";
                    }

                    var ajaxReq = $.ajax({
                        url: "includes/handlers/" + pageName,
                        type: "POST",
                        data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                        cache: false,

                        success: function(response) {
                            $('.dropdown_data_window').find('.nextPageDropdownData').remove(); //Removes current .nextpage 
                            $('.dropdown_data_window').find('.noMoreDropdownData').remove(); //Removes current .nextpage 

                            $('.dropdown_data_window').append(response);
                        }
                    });
                } //End if 
                return false;
            }); //End (window).scroll(function())
        });
    </script>

    <div class="wrapper">