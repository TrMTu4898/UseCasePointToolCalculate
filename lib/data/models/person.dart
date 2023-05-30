class Person {
  String uid;
  String email;
  String displayName;
  String photoUrl;
  String phoneNumber;
  String fullName;

  Person({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.photoUrl,
    required this.phoneNumber,
    required this.fullName
  });
  @override
  String toString() {
    return 'Person('
        'uid: $uid,'
        ' email: $email,'
        ' displayName: $displayName,'
        ' photoUrl: $photoUrl,'
        'fullName: $fullName,'
        'phoneNumber: $phoneNumber,'
        ')';
  }
}
