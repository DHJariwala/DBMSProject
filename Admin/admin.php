<html>
<?php
session_start();
?>
<body>
    <!-- This is admin page. -->
    <?php
        // echo "This is echo <br>";
        if(isset($_SESSION['username'])){
            $loginuser = $_SESSION['username'];
            //echo $loginuser;
        }
        else{
            echo "<br>session variable not set";
        }
    ?>
    <br><br><br>
    <label><?php echo $loginuser; ?></label><br>
    <img src="logo.png" alt="Logo Picture">
    <ul>
        <li><a href="admin.php">List Notice</a></li>
        <li><a href="postNotice.php">Post Notice</a></li>
        <li><a href="manageHouseOwner.php">Manage House Owner</a></li>
        <li><a href="manageStaff.php">Manage Staff</a></li>
        <li><a href="manageComplaint.php">Manage Complaint</a></li>
        <li><a href="maintenanceFee.php">Maintenance Fee</a></li>
    </ul>
</body>
</html>