import 'package:youtube_getx/modules/auth/domain/user.dart';
import 'package:youtube_getx/modules/auth/repository/auth.repository.interface.dart';

abstract class IAuthFacade {
  Future<User> signUp(SignUpDTO dto);
  Future<User?> signIn(String email, String password);
  Future<void> signOut();
  Future<User?> getCurrentUser();
  bool isLoggedIn();
}