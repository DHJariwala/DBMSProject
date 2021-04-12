<html>
<?php
session_start();
if(isset($_POST['submitAdmin'])){
    $servername = "127.0.0.1";
    $password = "password";
    $username = "root";
    $database = "dbProj";
    $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
    $sql = "select * from Admin where Admin_ID = '".$_POST['username']."';";
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['Password'] == $_POST['password']){
            $_SESSION['username'] = $_POST['username'];
            $conn->close();
            //echo $_SESSION['username']; //-session variable is setting
            header("Location: Admin/admin.php");
            exit();
        }
        else{
            echo "Enter correct password";
        }
    }
    else{
        echo "enter details properly";
    }
}

if(isset($_POST['submitHouse'])){
    $servername = "127.0.0.1";
    $password = "password";
    $username = "root";
    $database = "dbProj";
    $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
    $sql = "select * from House where Owner_ID = '".$_POST['username']."';";
    echo $sql;
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['Password'] == $_POST['password']){
            $_SESSION['username'] = $_POST['username'];
            $conn->close();
            header("Location: House/house.php");
            exit;
        }
        else{
            echo "Enter correct password";
        }
    }
    else{
        echo "enter details properly";
    }
}

if(isset($_POST['submitStaff'])){
    $servername = "127.0.0.1";
    $password = "password";
    $username = "root";
    $database = "dbProj";
    $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
    $sql = "select * from Staff where Person_ID = '".$_POST['username']."';";
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['Password'] == $_POST['password']){
            $_SESSION['username'] = $_POST['username'];
            $conn->close();
            header("Location: Staff/staff.php");
            exit;
        }
        else{
            echo "Enter correct password";
        }
    }
    else{
        echo "enter details properly";
    }
}
?>
<body>
    <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
    ID: <input type="text" name="username"> <br>
    Password: <input type="text" name="password"> <br>
    <input type="submit" name="submitAdmin" value="Submit Admin"><br>
    <input type="submit" name="submitHouse" value="Submit House"><br>
    <input type="submit" name="submitStaff" value="Submit Staff"><br>
    </form>
</body>
</html>