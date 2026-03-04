class Validation {

  Validation._();

  static final RegExp _emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  static String? required(
    String? value, {
    String message = "This field is required",
  }) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    final emptyCheck = required(value, message: "Enter your email");
    if (emptyCheck != null) return emptyCheck;

    if (!_emailRegExp.hasMatch(value!.trim())) {
      return "Email is not valid";
    }

    return null;
  }

  static String? password(String? value) {
    final emptyCheck = required(value, message: "Enter your password");
    if (emptyCheck != null) return emptyCheck;

    if (!_passwordRegExp.hasMatch(value!)) {
      return "Password must contain:\n"
          "• At least 8 characters\n"
          "• 1 uppercase letter\n"
          "• 1 lowercase letter\n"
          "• 1 number\n"
          "• 1 special character";
    }

    return null;
  }

  static bool isValidEmail(String value) => _emailRegExp.hasMatch(value.trim());

  static bool isValidPassword(String value) => _passwordRegExp.hasMatch(value);
}
