import 'package:fit_raho/entities/owner/owner_entity.dart';

class Owner {
  String ownerId;
  String name;
  String email;
  String gymName;
  String imageUrl;

  Owner({
    required this.ownerId,
    required this.name,
    required this.email,
    required this.gymName,
    required this.imageUrl,
  });

  static final empty = Owner(
    ownerId: '',
    name: '',
    email: '',
    gymName: '',
    imageUrl: '',
  );

  OwnerEntity toEntity() {
    return OwnerEntity(
      ownerId: ownerId,
      name: name,
      email: email,
      gymName: gymName,
      imageUrl: imageUrl,
    );
  }

  static Owner fromEntity(OwnerEntity entity) {
    return Owner(
      ownerId: entity.ownerId,
      name: entity.name,
      email: entity.email,
      gymName: entity.gymName,
      imageUrl: entity.imageUrl,
    );
  }
}
