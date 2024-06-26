import '../entities/entities.dart';

class Trainer {
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

  Trainer({
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

  static final empty = Trainer(
    trainerId: '',
    name: '',
    phoneNumber: '',
    gender: '',
    dateOfBirth: '',
    email: '',
    experience: '',
    dateOfJoining: '',
    endOfcontract: '',
    workingHours: '',
    imageUrl: '',
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
      endOfcontract: endOfcontract,
      workingHours: workingHours,
      imageUrl: imageUrl,
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
      endOfcontract: entity.endOfcontract,
      workingHours: entity.workingHours,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Trainer: $trainerId,$name,$phoneNumber,$gender,$dateOfBirth,$email,$experience,$dateOfJoining,$endOfcontract,$workingHours,$imageUrl,';
  }
}
