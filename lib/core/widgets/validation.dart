class Validation {
  bool validateEmail(String value) {
    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegEx.hasMatch(value)) {
      return false;
    }
    return true;
  }

  bool validatePassword(String password) {
    if (password.length < 6) return false;
    return true;
  }
}
