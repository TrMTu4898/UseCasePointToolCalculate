double ucpCalculate(double uucw, double uaw, double tcf, double ecf) {
  double result = (uucw + uaw) * tcf * ecf;
  return double.parse(result.toStringAsFixed(2));
}
