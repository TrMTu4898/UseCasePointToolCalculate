class UseCasePointsECF {
  int e1; //FamiliarityWithDevelopmentProcessUsed
  int e2; //ApplicationExperience
  int e3; //Object-orientedExperienceOfTeam
  int e4; //LeadAnalystCapability
  int e5; //MotivationOfTheTeam
  int e6; //StabilityOfRequirements
  int e7; //Part-timeStaff
  int e8; //DifficultProgrammingLanguage
  double ecf;

  UseCasePointsECF({
    required this.e1,
    required this.e2,
    required this.e3,
    required this.e4,
    required this.e5,
    required this.e6,
    required this.e7,
    required this.e8,
    required this.ecf,
  });
  factory UseCasePointsECF.fromMap(Map<String, dynamic> map) {
    return UseCasePointsECF(
      e1: map['FamiliarityWithDevelopmentProcessUsed'] ?? 0,
      e2: map['ApplicationExperience'] ?? 0,
      e3: map['ObjectOrientedExperienceOfTeam'] ?? 0,
      e4: map['LeadAnalystCapability'] ?? 0,
      e5: map['MotivationOfTheTeam'] ?? 0,
      e6: map['StabilityOfRequirements'] ?? 0,
      e7: map['PartTimeStaff'] ?? 0,
      e8: map['DifficultProgrammingLanguage'] ?? 0,
      ecf: map['ECF: '] ?? 0,
    );
  }
}
