class Validators {
  Validators._();

  static String? requiredField(
    String? value, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validateName(
    String? value, {
    String fieldName = 'Name',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(value.trim())) {
      return 'Only alphabets are allowed';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
    );

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }

    if (!RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
      return 'Enter valid 10 digit phone number';
    }

    return null;
  }

  static String? validateZipCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Zip Code is required';
    }

    if (!RegExp(r'^[0-9]{6}$').hasMatch(value.trim())) {
      return 'Enter valid 6 digit Zip Code';
    }

    return null;
  }

  static String? validateEmployeeId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Employee ID is required';
    }

    if (value.trim().length < 4) {
      return 'Employee ID is too short';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Minimum 8 characters required';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain one number';
    }

    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Must contain one special character';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    }

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  static String? validateDOB(DateTime? date) {
    if (date == null) {
      return 'Date of Birth is required';
    }

    final today = DateTime.now();

    int age = today.year - date.year;

    if (today.month < date.month ||
        (today.month == date.month && today.day < date.day)) {
      age--;
    }

    if (age < 18) {
      return 'Age must be at least 18 years';
    }

    return null;
  }
}
