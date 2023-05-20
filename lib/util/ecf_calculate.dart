double calculateECF(
    Map<String, String> dropValues,
    ) {
  Map<String, double> weights = {
    'Dropdown 1': 1.5,
    'Dropdown 2': 0.5,
    'Dropdown 3': 1,
    'Dropdown 4': 0.5,
    'Dropdown 5': 1,
    'Dropdown 6': 2,
    'Dropdown 7': -1,
    'Dropdown 8': -1,
  };
  double totalECF = 0;
  for (final entry in dropValues.entries) {
    final dropdownValue = double.tryParse(entry.value);
    if (dropdownValue != null) {
      final dropdownWeight = weights[entry.key] ?? 1;
      totalECF += dropdownValue * dropdownWeight;
    } else {
      print(entry.value);
      // Xử lý giá trị không hợp lệ ở đây (nếu cần)
    }
  }
  final ecf = 1.4 + (totalECF * -0.03);

  return ecf.toDouble();
}
