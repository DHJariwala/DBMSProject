<html>
<?php
    session_start();
     echo "This is echo <br>";
    if(isset($_SESSION['username'])){
        $loginuser = $_SESSION['username'];
    }
    else{
        echo "<br>session variable not set";
    }
    ?>
<body>
<br><br><br>
<label><?php echo $loginuser; ?></label><br>
<img src="logo.png" alt="Logo Picture">
<ul>
    <li><a href="house.php">List Notice</a></li>
    <li><a href="memberMaintenance.php">Member Maintenance</a></li>
    <li><a href="guestLog.php">Guest Log</a></li>
    <li><a href="maintenanceFee.php">Maintenance Fee</a></li>
    <li><a href="complaint.php">Complaint</a></li>
</ul>
</body>
</html>