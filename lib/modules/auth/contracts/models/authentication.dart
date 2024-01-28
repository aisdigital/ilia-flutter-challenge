
import 'package:ilia_challenge/modules/auth/contracts/interfaces/i_authentication.dart';

class EmailAuthentication extends IAuthentication {
  final String email;
  final String password;

  EmailAuthentication({
    required this.email,
    required this.password,
  }) : super(
          credentials: {
            'email': email,
            'password': password,
          },
        );
}
