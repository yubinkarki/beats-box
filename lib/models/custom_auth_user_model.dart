import "package:flutter/foundation.dart" show immutable;

import "package:equatable/equatable.dart" show Equatable;
import "package:firebase_auth/firebase_auth.dart" show User;

@immutable
class CustomAuthUser extends Equatable {
  final String id;
  final String email;

  const CustomAuthUser({required this.id, required this.email});

  // Defining a factory constructor called firebaseCheck.
  factory CustomAuthUser.firebaseCheck(User user) => CustomAuthUser(id: user.uid, email: user.email!);

  @override
  List<Object?> get props => [id, email];

  @override
  bool get stringify => true;
}
