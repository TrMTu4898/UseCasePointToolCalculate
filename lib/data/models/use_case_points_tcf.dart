class UseCasePointsTCF {
  int t1; //DistributedSystem
  int t2; //ResponseTime/PerformanceObjectives
  int t3; //End-UserEfficiency
  int t4; //InternalProcessingComplexity
  int t5; //CodeReusability
  int t6; //EasyToInstall
  int t7; //EasyToUser
  int t8; //PortabilityToOtherPlatforms
  int t9; //SystemMaintenance
  int t10; //Concurrent/parallelProcessing
  int t11; //SecurityFeatures
  int t12; //AccessForThirdParties
  int t13; //EndUserTraining
  double tcf;

  UseCasePointsTCF({
    required this.t1,
    required this.t2,
    required this.t3,
    required this.t4,
    required this.t5,
    required this.t6,
    required this.t7,
    required this.t8,
    required this.t9,
    required this.t10,
    required this.t11,
    required this.t12,
    required this.t13,
    required this.tcf,
  });
  factory UseCasePointsTCF.fromMap(Map<String, dynamic> map) {
    return UseCasePointsTCF(
      t1: map['DistributedSystem'] ?? 0,
      t2: map['ResponseTime/PerformanceObjectives'] ?? 0,
      t3: map['End-UserEfficiency'] ?? 0,
      t4: map['InternalProcessingComplexity'] ?? 0,
      t5: map['CodeReusability'] ?? 0,
      t6: map['EasyToInstall'] ?? 0,
      t7: map['EasyToUser'] ?? 0,
      t8: map['PortabilityToOtherPlatforms'] ?? 0,
      t9: map['SystemMaintenance'] ?? 0,
      t10: map['Concurrent/parallelProcessing'] ?? 0,
      t11: map['SecurityFeatures'] ?? 0,
      t12: map['AccessForThirdParties'] ?? 0,
      t13: map['EndUserTraining'] ?? 0,
      tcf: map['TCF: '] ?? 0,
    );
  }
}
