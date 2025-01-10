
class AuthUser {
  final String uid;
  final String? email;
  final String? displayName;
  final bool isEmailVerified;

  AuthUser({
    required this.uid,
    this.email,
    this.displayName,
    this.isEmailVerified = false,
  });
}
