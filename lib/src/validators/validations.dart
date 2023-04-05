class validations{
  static bool isValidUser(String user){
    if(user !=null && user.length > 6 && user.contains('@gmail.com')){
      return true;
    }
    else return false;
  }
  static bool isValidPass(String pass){
    if (pass != null && pass.length>6){
      return true;
    }
    else return false;
  }
}