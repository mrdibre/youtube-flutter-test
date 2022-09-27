import 'package:youtube_getx/modules/auth/domain/user.dart';
import 'package:youtube_getx/modules/auth/facade/auth.facade.interface.dart';
import 'package:youtube_getx/modules/auth/repository/auth.repository.interface.dart';

class AuthFacade implements IAuthFacade {
  late IAuthRepository _authRepository;

  AuthFacade({ required IAuthRepository authRepository }) {
    _authRepository = authRepository;
  }

  @override
  signUp(SignUpDTO dto) async {
    return _authRepository.signUp(dto);
  }

  @override
  Future<User?> getCurrentUser() {
    return _authRepository.getCurrentUser();
  }

  @override
  bool isLoggedIn() {
    return _authRepository.isLoggedIn();
  }

  @override
  Future<User?> signIn(String email, String password) {
    return _authRepository.signIn(email, password);
  }

  @override
  Future<void> signOut() {
    return _authRepository.signOut();
  }
}