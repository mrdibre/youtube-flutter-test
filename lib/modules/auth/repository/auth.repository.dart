import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:youtube_getx/modules/@shared/constants/collections.dart';
import 'package:youtube_getx/modules/auth/domain/user.dart' as domain;
import 'package:youtube_getx/modules/auth/repository/auth.repository.interface.dart';

class AuthRepository implements IAuthRepository {
  @override
  Future<domain.User> signUp(SignUpDTO dto) async {
    var userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: dto.email, password: dto.password);
    await userCredential.user!.updateDisplayName(dto.name);

    var user = domain.User(id: userCredential.user!.uid, name: dto.name, email: dto.email);

    await FirebaseFirestore.instance.collection(Collection.users.name).doc(user.id).set(user.toMap());

    return user;
  }

  @override
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<domain.User?> getCurrentUser() async {
    var userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      return null;
    }

    var user = await FirebaseFirestore.instance.collection(Collection.users.name).doc(userId).get();

    return domain.User(
      id: userId,
      name: user["name"],
      email: user["email"],
      profilePicture: user["profilePicture"]
    );
  }

  @override
  Future<domain.User?> signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    return getCurrentUser();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}