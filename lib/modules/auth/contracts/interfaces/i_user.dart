abstract class IUser {
  String id;
  String email;
  String? refreshToken;
  String? nick;
  String? name;
  String? profile;
  IUser({
    required this.id,
    required this.email,
    required this.nick,
    required this.name,
    required this.profile,
    required this.refreshToken,
  });
}
