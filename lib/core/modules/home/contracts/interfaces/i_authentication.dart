abstract class IAuthentication {
  AuthStatus status;
  Map credentials;
  IAuthentication({
    this.status = AuthStatus.authenticating,
    required this.credentials,
  });
}

enum AuthStatus {
  unauthenticated,
  authenticating,
  authenticated,
  waiting,
}
