class UserModel {
  factory UserModel.fromFirebaseUser(final dynamic user) {
    return UserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      emailVerified: user.emailVerified,
      createdAt: DateTime.now(),
    );
  }

  UserModel({
    this.isselcted = false,
    required this.uid,
    required this.email,
    required this.displayName,
    required this.createdAt,
    this.emailVerified = false,
    this.photoUrl,
    this.phone,
  });

  factory UserModel.fromMap(final Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      displayName: map['displayName'] ?? '',
      phone: map['phone'] ?? '',
      emailVerified: map['emailVerified'] ?? false,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
  final String uid;
  final String email;
  final String displayName;
  final String? photoUrl;
  final String? phone;
  final bool emailVerified;
  final DateTime createdAt;
  bool isselcted;

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'emailVerified': emailVerified,
      'createdAt': createdAt.toIso8601String(),
      'phone': phone,
    };
  }

  UserModel copyWithModel({
    final String? uid,
    final String? email,
    final String? displayName,
    final String? photoUrl,
    final String? phone,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      createdAt: createdAt,
      phone: phone ?? this.phone,
    );
  }
}
