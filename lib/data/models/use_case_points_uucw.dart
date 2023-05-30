class UseCasePointsUUCW {
  int simple;
  int average;
  int complex;
  double uucw;

  UseCasePointsUUCW({
    required this.simple,
    required this.average,
    required this.complex,
    required this.uucw,
  });

  factory UseCasePointsUUCW.fromMap(Map<String, dynamic> map){
    return UseCasePointsUUCW(
      simple: map['Simple'] ?? 0,
      average: map['Average'] ?? 0,
      complex: map['Complex'] ?? 0,
      uucw: map['UUCW'] ?? 0,
    );
  }
}
