function todayDate(){
    var today = new Date();
      var dd = today.getDate();
  
      var mm = today.getMonth()+1; 
      var yyyy = today.getFullYear();
      if(dd<10) 
      {
          dd='0'+dd;
      } 
  
      if(mm<10) 
      {
          mm='0'+mm;
      } 
  
      today = yyyy+'-' + mm+'-'+dd;
      console.log(today);
      return today;
      
  }

document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("InputDOB").setAttribute("max", todayDate());
});

function validatePassword(){
    var form = document.forms["myForm"];
    var password1=form["InputNewPassword"];
    var password2=form["InputConfirmPassword"];
    
    
    if (password1.value!=password2.value) {
      document.getElementById("invalid-feedback").style.display="block";
      // password1.focus;
      return false;
    }
  }