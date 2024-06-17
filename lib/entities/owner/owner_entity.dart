class AdminEntity {
  final String adminId;
  final String name;
  final String email;
  final String gymName;

  AdminEntity({
    required this.adminId,
    required this.name,
    required this.email,
    required this.gymName,
  });

  Map<String, dynamic> toDocument() {
    return {
      'adminId': adminId,
      'name': name,
      'email': email,
      'gymName': gymName,
    };
  }

  factory AdminEntity.fromDocument(Map<String, dynamic> doc) {
    return AdminEntity(
      adminId: doc['adminId'],
      name: doc['name'],
      email: doc['email'],
      gymName: doc['gymName'],
    );
  }
}
