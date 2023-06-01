class ValidationHelper {
  static String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product name';
    }
    return null;
  }

  static String? validateProductPrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter product price';
    }
    return null;
  }
}
