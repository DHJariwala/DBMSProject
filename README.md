# DBMS Project
### Goal
To study about method to connect php with MySql. 
### Website description
We are creating a website to manage a society and people living in it.
### How we are connecting php to MySql
we use mysqli to connect php to mysql.

`$conn = mysqli_connect($servername,$username,$password,$database);`

To run a query in mysql we run the following php code.

`$result = $conn->query($sql);`

To close php and MySql connection we write the code:

`$conn->close();`

The final code to run a query in MySql through php would look like 
```php
<?php
if(isset($_POST['submit'])){
  $servername = "127.0.0.1";
  $password = "password";
  $username = "root";
  $database = "test";
  $conn = mysqli_connect($servername,$username,$password,$database,'3306') or die("unable to connect");
  $sql = "insert into t values(".$_POST['test_text'].");";
  $result = $conn->query($sql);
  $conn->close();
}
?>
```

For the above code, the html should look like:

```html
<html>
  <body>
     <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method = "post">
        Enter a number: <input type="text" name = "test_text">
        <input type="submit" value = "submit" name = "submit">
      </form>
  </body>
</html>
```

#### Explaination of some parts of the code
`if(isset($POST['submit'])` ensures that the code inside the `if` statement is runned only when submit button is pressed.

`$POST['Any name in HTML']` takes the value in the field specified by the name of that element in the HTML document.

`of die("unable to connect");` will stop execution of the program when MySql and php are not connected;

`session_start();` is used to start a session. Session helps us to store values (on server) to be used in different webpages.

`$_SESSION['username']`:-  Here, `$_SESSION` is an array (like dictionary in python) which stores values in index as string. Thus here 'username' is the index for the value `$_POST['username']`. Now in any webpage, so long the webpage is this server and has same domain, this array can be used anywhere.

In admin.php, house.php, staff.php we first start the session by `session_start()` this means that this webpage must use session variables. The `if` statement ensures that the session variable is set by the `isset` function. If the variable is set then `$loginuser` must be set equal to `$_SESSION['usernam']`. Now we can use `$loginuser` in the whole webpage to get the username (This username was entered in mainPage.php). 
Thus, `<?php echo $loginuser ?>` prints the name of the user who is currently using the website.  

### Details about the website
#### Admin
#### House
#### Staff
