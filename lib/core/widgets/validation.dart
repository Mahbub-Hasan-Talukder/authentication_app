class Validation {
  bool validateEmail(String value) {
    final emailRegEx = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    bool matched = emailRegEx.hasMatch(value);
    return matched;
  }

  bool validatePassword(String password) {
    if (password.length < 6) return false;
    return true;
  }
}
