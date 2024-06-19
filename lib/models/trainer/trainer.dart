import 'package:fit_raho/entities/trainer/trainer_entity.dart';

class Trainer {
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

  Trainer({
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

  static final empty = Trainer(
    trainerId: '',
    name: '',
    phoneNumber: '',
    gender: '',
    dateOfBirth: '',
    email: '',
    experience: '',
    dateOfJoining: '',
    endOfContract: '', // corrected
    workingHours: '',
    imageUrl: '',
    role: '',
  );

  TrainerEntity toEntity() {
    return TrainerEntity(
      trainerId: trainerId,
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      email: email,
      experience: experience,
      dateOfJoining: dateOfJoining,
      endOfContract: endOfContract, // corrected
      workingHours: workingHours,
      imageUrl: imageUrl,
      role: role,
    );
  }

  static Trainer fromEntity(TrainerEntity entity) {
    return Trainer(
      trainerId: entity.trainerId,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      gender: entity.gender,
      dateOfBirth: entity.dateOfBirth,
      email: entity.email,
      experience: entity.experience,
      dateOfJoining: entity.dateOfJoining,
      endOfContract: entity.endOfContract, // corrected
      workingHours: entity.workingHours,
      imageUrl: entity.imageUrl,
      role: entity.role,
    );
  }

  @override
  String toString() {
    return 'Trainer: $trainerId,$name,$phoneNumber,$gender,$dateOfBirth,$email,$experience,$dateOfJoining,$endOfContract,$workingHours,$imageUrl,$role'; // corrected
  }
}
