class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? photoUrl;

  final int level;
  final int xp;
  final int streak;

  final int gardenLevel;
  final int passportCities;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.level,
    required this.xp,
    required this.streak,
    required this.gardenLevel,
    required this.passportCities,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'],
      level: map['level'] ?? 1,
      xp: map['xp'] ?? 0,
      streak: map['streak'] ?? 0,
      gardenLevel: map['gardenLevel'] ?? 1,
      passportCities: map['passportCities'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
      'level': level,
      'xp': xp,
      'streak': streak,
      'gardenLevel': gardenLevel,
      'passportCities': passportCities,
    };
  }

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    int? level,
    int? xp,
    int? streak,
    int? gardenLevel,
    int? passportCities,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      level: level ?? this.level,
      xp: xp ?? this.xp,
      streak: streak ?? this.streak,
      gardenLevel: gardenLevel ?? this.gardenLevel,
      passportCities: passportCities ?? this.passportCities,
    );
  }
}