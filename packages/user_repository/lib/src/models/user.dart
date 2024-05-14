import '../entities/entities.dart';

class MyUser {
  String userId;
  String name;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String email;
  String role;

  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.role,
  });

  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    dateOfBirth: '',
    gender: '',
    phoneNumber: '',
    role: '',
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      role: role,
    );
  }

  static MyUser formEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      dateOfBirth: entity.dateOfBirth,
      gender: entity.gender,
      phoneNumber: entity.phoneNumber,
      role: entity.role,
    );
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $dateOfBirth, $gender, $phoneNumber, $role,';
  }
}
