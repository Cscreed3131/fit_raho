class OwnerEntity {
  String ownerId;
  String name;
  String email;
  String gymName;
  String imageUrl;
  String role;

  OwnerEntity({
    required this.ownerId,
    required this.name,
    required this.email,
    required this.gymName,
    required this.imageUrl,
    required this.role,
  });

  Map<String, dynamic> toDocument() {
    return {
      'ownerId': ownerId,
      'name': name,
      'email': email,
      'gymName': gymName,
      'imageUrl': imageUrl,
      'role': role,
    };
  }

  factory OwnerEntity.fromDocument(Map<String, dynamic> doc) {
    return OwnerEntity(
        ownerId: doc['ownerId'],
        name: doc['name'],
        email: doc['email'],
        gymName: doc['gymName'],
        imageUrl: doc['imageUrl'],
        role: doc['role']);
  }
}
