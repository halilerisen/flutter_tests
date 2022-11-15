class Validator {
  static String? validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Required Field';
    }

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return 'Please enter a valid email id';
    }
    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Required Field';
    }

    if (password.length < 8) {
      return 'Please enter at least 8 character for password';
    }
    return null;
  }
}
