double calculateTCF(
  Map<String, String> dropValues,
) {
  Map<String, double> weights = {
    'Dropdown 1': 2,
    'Dropdown 2': 1,
    'Dropdown 3': 1,
    'Dropdown 4': 1,
    'Dropdown 5': 1,
    'Dropdown 6': 0.5,
    'Dropdown 7': 0.5,
    'Dropdown 8': 2,
    'Dropdown 9': 1,
    'Dropdown 10': 1,
    'Dropdown 11': 1,
    'Dropdown 12': 1,
    'Dropdown 13': 1,
  };
  double totalTCF = 0;
  for (final entry in dropValues.entries) {
    final dropdownValue = double.tryParse(entry.value);
    if (dropdownValue != null) {
      final dropdownWeight = weights[entry.key] ?? 1;
      totalTCF += dropdownValue * dropdownWeight;
    } else {
      print(entry.value);
      // Xử lý giá trị không hợp lệ ở đây (nếu cần)
    }
  }
  final tcf = 0.6 + (totalTCF / 100);

  return tcf.toDouble();
}
