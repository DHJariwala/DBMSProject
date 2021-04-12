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
    <?php
        $servername = "127.0.0.1";
        $password = "password";
        $username = "root";
        $database = "dbProj";
        $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
        $sql = "select N_TimeStamp,Subject,Description from Notice order by N_TimeStamp";
        $result = $conn->query($sql);
        echo "<table border='2px' cellpadding='10px'><tr><th>Timestamp</th><th>Subject</th><th>Description</th></tr>";
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>".$row['N_TimeStamp']."</td><td>".$row['Subject']."</td><td>".$row['Description']."</td></tr>";
            //   echo "id: " . $row["id"]. " - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
            }
            echo "</table>";
          } else {
            echo "0 results";
          }
          $conn->close();

    ?>
</body>
</html>