class TrainerEntity {
  String trainerId;
  String name;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String email;
  String experience;
  String dateOfJoining;
  String endOfContract; // corrected
  String workingHours;
  String imageUrl;
  String role;

  TrainerEntity({
    required this.trainerId,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    required this.experience,
    required this.dateOfJoining,
    required this.endOfContract, // corrected
    required this.workingHours,
    required this.imageUrl,
    required this.role,
  });

  Map<String, Object?> toDocument() {
    return {
      'trainerId': trainerId,
      'name': name,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'dateOfBirth': dateOfBirth,
      'email': email,
      'experience': experience,
      'dateOfJoining': dateOfJoining,
      'endOfContract': endOfContract, // corrected
      'workingHours': workingHours,
      'imageUrl': imageUrl,
      'role': role,
    };
  }

  static TrainerEntity fromDocument(Map<String, dynamic> doc) {
    return TrainerEntity(
      trainerId: doc['trainerId'],
      name: doc['name'],
      phoneNumber: doc['phoneNumber'],
      gender: doc['gender'],
      dateOfBirth: doc['dateOfBirth'],
      email: doc['email'],
      experience: doc['experience'],
      dateOfJoining: doc['dateOfJoining'],
      endOfContract: doc['endOfContract'], // corrected
      workingHours: doc['workingHours'],
      imageUrl: doc['imageUrl'],
      role: doc['role'],
    );
  }
}
