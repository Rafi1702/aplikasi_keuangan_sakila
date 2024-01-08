class GlobalValidator {
  static String? fieldBarang(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName Barang tidak boleh kosong';
    }
    return null;
  }
}
