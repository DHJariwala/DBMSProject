<html>
<?php
if(isset($_POST['submitAdmin'])){
    $servername = "127.0.0.1";
    $password = "password";
    $username = "root";
    $database = "dbProj";
    $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
    $sql = "select * from Admin where username = '".$_POST['username']."';";
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['password'] == $_POST['password']){
            $conn->close();
            header("Location: admin.php");
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

if(isset($_POST['submitHouse'])){
    $servername = "127.0.0.1";
    $password = "password";
    $username = "root";
    $database = "dbProj";
    $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
    $sql = "select * from House where username = '".$_POST['username']."';";
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['password'] == $_POST['password']){
            $conn->close();
            header("Location: house.php");
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
    $sql = "select * from Staff where username = '".$_POST['username']."';";
    $result = $conn -> query($sql);
    if($result->num_rows > 0){
        $row = $result -> fetch_assoc();
        if($row['password'] == $_POST['password']){
            $conn->close();
            header("Location: staff.php");
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