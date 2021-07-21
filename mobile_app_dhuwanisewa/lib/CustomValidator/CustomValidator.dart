class CustomValidator {
  static bool isMobileNumber(String mobileNumber) {
    RegExp reg = new RegExp(r'^[0-9]{10}$');
    if (reg.hasMatch(mobileNumber))
      return true;
    else
      return false;
  }

  static bool isEmail(String email) {
    String pattern = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    RegExp reg = new RegExp(pattern);
    if (reg.hasMatch(email))
      return true;
    else
      return false;
  }
}
