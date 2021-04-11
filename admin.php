<html>
<?php
session_start();
?>
<body>
    This is admin page.
    <?php
        echo "This is echo <br>";
        if(isset($_SESSION['username'])){
            $loginuser = $_SESSION['username'];
            //echo $loginuser;
        }
        else{
            echo "<br>session variable not set";
        }
    ?>
    <br><br><br>
    <label><?php echo $loginuser; ?></label>
</body>
</html>