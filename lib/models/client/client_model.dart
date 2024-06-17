import 'package:fit_raho/entities/client/client_entity.dart';

class Client {
  String userId;
  String name;
  String phoneNumber;
  String gender;
  String dateOfBirth;
  String email;
  String role;
  String imageUrl;

  Client({
    required this.userId,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.phoneNumber,
    required this.role,
    required this.imageUrl,
  });

  static final empty = Client(
    userId: '',
    email: '',
    name: '',
    dateOfBirth: '',
    gender: '',
    phoneNumber: '',
    role: '',
    imageUrl: '',
  );

  ClientEntity toEntity() {
    return ClientEntity(
      userId: userId,
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      role: role,
      imageUrl: imageUrl,
    );
  }

  static Client formEntity(ClientEntity entity) {
    return Client(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      dateOfBirth: entity.dateOfBirth,
      gender: entity.gender,
      phoneNumber: entity.phoneNumber,
      role: entity.role,
      imageUrl: entity.imageUrl,
    );
  }

  @override
  String toString() {
    return 'Client: $userId, $email, $name, $dateOfBirth, $gender, $phoneNumber, $role, $imageUrl';
  }
}
