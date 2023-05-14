import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:logging/logging.dart';
import 'package:usecasepointstool/data/models/person.dart';

class PersonRepository {
  final FirebaseAuth _firebaseAuth;
  final _logger = Logger('UserRepository');
  late StreamController<Person?> _userController;

  PersonRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      _logger.info('${record.level.name}: ${record.time}: ${record.message}');
    });
    _userController = StreamController<Person?>();
    _firebaseAuth.authStateChanges().listen((firebaseUser) {
      _userController.add(firebaseUser == null
          ? null
          : Person(
              uid: firebaseUser.uid,
              fullName: firebaseUser.displayName ?? '',
              email: firebaseUser.email ?? '',
              displayName: firebaseUser.displayName ?? '',
              photoUrl: firebaseUser.photoURL ?? '',
            ));
    });
  }

  Stream<Person?> get user => _userController.stream;

  Future<User?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e, stackTrace) {
      _logger.severe('Failed to sign up user:', e, stackTrace);
      return null;
    }
  }

  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e, stackTrace) {
      _logger.severe('Failed to sign in user:', e, stackTrace);
      return null;
    }
  }

  Future<Future<List<void>>> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }

  Future<Person?> getUser() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      return Person(
          uid: currentUser.uid,
          fullName: currentUser.displayName ?? '',
          email: currentUser.email ?? '',
          displayName: currentUser.displayName ?? '',
          photoUrl: currentUser.photoURL ?? '');
    } else {
      return null;
    }
  }

  Future<String?> getUserId() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser?.uid;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<bool> isEmailVerified() async {
    final currentUser = _firebaseAuth.currentUser;
    return currentUser!.emailVerified;
  }

  Future<void> reloadUser() async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser!.reload();
  }

  Future<void> sendEmailVerification() async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser!.sendEmailVerification();
  }

  Future<void> updateDisplayName(String displayName) async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser!.updateDisplayName(displayName);
  }

  Future<void> updatePhotoUrl(String photoUrl) async {
    final currentUser = _firebaseAuth.currentUser;
    await currentUser!.updatePhotoURL(photoUrl);
  }
}
