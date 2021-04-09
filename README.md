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
