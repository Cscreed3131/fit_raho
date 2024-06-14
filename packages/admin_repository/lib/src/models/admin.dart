import '../entities/entities.dart';

class Admin {
  final String adminId;
  final String name;
  final String email;
  final String gymName;

  Admin({
    required this.adminId,
    required this.name,
    required this.email,
    required this.gymName,
  });

  static final empty = Admin(
    adminId: '',
    name: '',
    email: '',
    gymName: '',
  );

  AdminEntity toEntity() {
    return AdminEntity(
      adminId: adminId,
      name: name,
      email: email,
      gymName: gymName,
    );
  }

  static Admin fromEntity(AdminEntity entity) {
    return Admin(
      adminId: entity.adminId,
      name: entity.name,
      email: entity.email,
      gymName: entity.gymName,
    );
  }
}
