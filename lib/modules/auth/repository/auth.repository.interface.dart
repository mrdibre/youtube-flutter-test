import 'package:youtube_getx/modules/auth/domain/user.dart';

class SignUpDTO {
  String name;
  String email;
  String password;

  SignUpDTO({ required this.name, required this.email, required this.password });
}

abstract class IAuthRepository {
  bool isLoggedIn();
  Future<User?> getCurrentUser();
  Future<User?> signIn(String email, String password);
  Future<User> signUp(SignUpDTO dto);
  Future<void> signOut();
}