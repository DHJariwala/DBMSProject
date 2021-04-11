<html>
<?php
     echo "This is echo <br>";
    if(isset($_SESSION['username'])){
        $loginuser = $_SESSION['username'];
    }
    else{
        echo "<br>session variable not set";
    }
    ?>
<body>
    This is House page.
</body>
</html>