import "package:equatable/equatable.dart" show Equatable;

class GoogleUser extends Equatable {
  final int? userId;
  final String? gender;
  final String? fullName;
  final String? emailAddress;
  final String? profilePicture;

  const GoogleUser({
    this.userId,
    this.gender,
    this.fullName,
    this.emailAddress,
    this.profilePicture,
  });

  @override
  List<Object?> get props => [userId, emailAddress];

  @override
  bool get stringify => true;
}
