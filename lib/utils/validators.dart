class Validators {
  // Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  // Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  // Confirm Password Validator
  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  // Name Validator
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  // Phone Validator
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return null; // Phone is optional
    }

    final phoneRegex = RegExp(r'^[0-9+\-\s()]{8,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  // URL Validator
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return null; // URL is optional
    }

    final urlRegex = RegExp(
      r'^(https?://)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*/?$',
      caseSensitive: false,
    );

    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid URL';
    }

    return null;
  }

  // Required Field Validator
  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }
    return null;
  }

  // Min Length Validator
  static String? validateMinLength(String? value, int minLength,
      {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'Field'} is required';
    }

    if (value.length < minLength) {
      return '${fieldName ?? 'Field'} must be at least $minLength characters';
    }

    return null;
  }

  // Max Length Validator
  static String? validateMaxLength(String? value, int maxLength,
      {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (value.length > maxLength) {
      return '${fieldName ?? 'Field'} must be less than $maxLength characters';
    }

    return null;
  }

  // Numeric Validator
  static String? validateNumeric(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return null;
    }

    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return '${fieldName ?? 'Field'} must be a number';
    }

    return null;
  }

  // Date Validator
  static String? validateDate(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return null;
    }

    final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegex.hasMatch(value)) {
      return 'Please enter a valid date (YYYY-MM-DD)';
    }

    try {
      DateTime.parse(value);
      return null;
    } catch (e) {
      return 'Please enter a valid date';
    }
  }
}
