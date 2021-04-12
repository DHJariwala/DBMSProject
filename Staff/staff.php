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
<ul>
    <li><a href="complaint.php">Complaint</a></li>
    <li><a href="guestManagement.php">Guest Management</a></li>
    <li><a href="staff.php">Check Person</a></li>
</ul>
</body>
</html>