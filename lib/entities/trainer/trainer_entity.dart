class TrainerEntity {
  String trainerId;
  String name;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String email;
  String experience;
  String dateOfJoining;
  String endOfcontract;
  String workingHours;
  String imageUrl;

  TrainerEntity({
    required this.trainerId,
    required this.name,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    required this.experience,
    required this.dateOfJoining,
    required this.endOfcontract,
    required this.workingHours,
    required this.imageUrl,
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
      'dateOfJoinging': dateOfJoining,
      'endOfContract': endOfcontract,
      'workingHours': workingHours,
      'imageUrl': imageUrl,
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
        endOfcontract: doc['endOfcontract'],
        workingHours: doc['workingHours'],
        imageUrl: doc['imageUrl']);
  }
}
