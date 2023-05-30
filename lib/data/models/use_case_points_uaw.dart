class UseCasePointsUAW {
  int simple;
  int average;
  int complex;
  double uaw;

  UseCasePointsUAW({
    required this.simple,
    required this.average,
    required this.complex,
    required this.uaw,
  });

  factory UseCasePointsUAW.fromMap(Map<String, dynamic> map){
    return UseCasePointsUAW(
        simple: map['Simple'] ?? 0,
        average: map['Average'] ?? 0,
        complex: map['Complex'] ?? 0,
        uaw: map['UAW'] ?? 0,
    );
  }
}
