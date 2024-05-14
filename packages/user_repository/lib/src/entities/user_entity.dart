class MyUserEntity {
  String userId;
  String name;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String email;
  String role;

  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.role,
  });
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      dateOfBirth: doc['dateOfBirth'],
      gender: doc['gender'],
      phoneNumber: doc['phoneNumber'],
      role: doc['role'],
    );
  }
}
