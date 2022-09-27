import 'package:youtube_getx/modules/auth/facade/auth.facade.dart';
import 'package:youtube_getx/modules/auth/facade/auth.facade.interface.dart';
import 'package:youtube_getx/modules/auth/repository/auth.repository.dart';

IAuthFacade auth() {
  var repository = AuthRepository();

  return AuthFacade(authRepository: repository);
}