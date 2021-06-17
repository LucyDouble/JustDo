$(document).load(function(){
     if($(sessionScope.student_id == null && sessionScope.teacher_id == null)){
         $('#signUpPage').show();
         $('#login').show();
     }else{
         $('#signUpPage').hide();
         $('#login').hide();
         $('#logout').show();
     }


 });