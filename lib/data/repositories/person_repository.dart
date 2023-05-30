import 'dart:async';
import 'dart:io';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart' as path;
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logging/logging.dart';
import '../models/person.dart';

class PersonRepository {
  final FirebaseAuth _firebaseAuth;
  final _logger = Logger('UserRepository');
  late StreamController<Person?> _userController;
  final FirebaseStorage _firebaseStorage;

  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('Users');

  PersonRepository(
      {FirebaseAuth? firebaseAuth, FirebaseStorage? firebaseStorage})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance {
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
              email: firebaseUser.email ?? '',
              displayName: firebaseUser.displayName ?? '',
              phoneNumber: firebaseUser.phoneNumber ?? '',
              fullName: '',
              photoUrl: firebaseUser.photoURL ?? '',
            ));
    });
  }
  Future<void> createUser(Person person) async {
    await _usersCollection.doc(person.uid).set({
      'displayName': person.displayName,
      'fullName': person.fullName,
      'email': person.email,
      'phoneNumber': person.phoneNumber,
      'photoUrl ': person.photoUrl,
    });
  }

  Future<Person?> getUser(String uid) async {
    final DocumentSnapshot snapshot = await _usersCollection.doc(uid).get();

    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      return Person(
          fullName: data['fullName'],
          displayName: data['displayName'],
          phoneNumber: data['phoneNumber'],
          email: data['email'],
          uid: uid,
          photoUrl: data['photoUrl']);
    }

    return null;
  }

  Stream<Person?> get user => _userController.stream;

  Future<Person?> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;
      final Person person = Person(
        uid: user.uid,
        email: user.email ?? '',
        displayName: user.displayName ?? '',
        photoUrl: user.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/usecasepointtool.appspot.com/o/imgProfile%2Fyav8pcpb.png?alt=media&token=ec80c83c-192f-4202-842b-476402270239',
        phoneNumber: user.phoneNumber ?? '',
        fullName: fullName,
      );
      addUserCollection(
        userID: person.uid,
        fullName: person.fullName,
        email: person.email,
        photoUrl: person.photoUrl,
        displayName: person.fullName,
        phoneNumber: person.phoneNumber,
      );
      return person;
    } catch (e, stackTrace) {
      _logger.severe('Failed to sign up user:', e, stackTrace);
      return null;
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User user = userCredential.user!;
      return user.uid;
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

  Future<void> addUserCollection({
    required String userID,
    required String fullName,
    required String email,
    required String photoUrl,
    required String displayName,
    required String phoneNumber,
  }) async {
    try {
      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('Users');
      final userDoc = userCollection.doc(userID);
      final userData = {
        'fullName': fullName,
        'email': email,
        'photoUrl': photoUrl,
        'displayName': displayName,
        'phoneNumber': phoneNumber,
      };
      await userDoc.set(userData);
      print('User data added to Firestore collection successfully!');
    } catch (e) {
      print('Error adding user data to Firestore: $e');
    }
  }

  Future<String> uploadImage(File imageFile, String fileName) async {
    Reference storageReference =
        _firebaseStorage.ref().child('images/$fileName');

    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot snapshot = await uploadTask;

    if (snapshot.state == TaskState.success) {
      String imageUrl = await storageReference.getDownloadURL();
      return imageUrl;
    }

    return '';
  }

  Future<void> updateUser({
    required String userID,
    required String email,
    required String photoUrl,
    required String displayName,
    required String phoneNumber,
    required String fullName,
  }) async {
    try {
      if (photoUrl.isNotEmpty) {
        File imageFile = File(photoUrl);
        String fileName = path.basename(imageFile.path);

        // Tải lên ảnh lên Firebase Storage và nhận URL ảnh mới
        String newPhotoUrl = await uploadImage(imageFile, fileName);

        // Cập nhật URL ảnh vào Firestore
        final CollectionReference userCollection =
            FirebaseFirestore.instance.collection('Users');
        final userDoc = userCollection.doc(userID);
        final userData = {
          'photoUrl': newPhotoUrl,
          'displayName': displayName,
          'phoneNumber': phoneNumber,
          'fullName': fullName,
        };
        await userDoc.update(userData);
        print('User data updated in Firestore successfully!');
      } else {
        final CollectionReference userCollection =
            FirebaseFirestore.instance.collection('Users');
        final userDoc = userCollection.doc(userID);
        final userData = {
          'displayName': displayName,
          'phoneNumber': phoneNumber,
          'fullName': fullName,
        };
        await userDoc.update(userData);
        print('User data updated in Firestore successfully!');
      }
    } catch (e) {
      print('Error updating user data in Firestore: $e');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Get the user's information
    final User? user = userCredential.user;

    // Add user information to collectionUser
    if (user != null) {
      await addUserCollection(
          userID: user.uid,
          fullName: user.displayName!,
          email: user.email!,
          photoUrl: user.photoURL!,
          displayName: user.displayName!,
          phoneNumber: user.phoneNumber!,
      );
    }

    return userCredential;
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken != null) {
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      // Lấy thông tin người dùng từ Facebook
      final userData =
          await FacebookAuth.instance.getUserData(fields: "name,email,picture");

      // Thêm thông tin người dùng vào collectionUser
      await FirebaseFirestore.instance
          .collection('collectionUser')
          .doc(userCredential.user!.uid)
          .set({
        'name': userData['name'],
        'email': userData['email'],
        'profilePicture': userData['picture']['data']['url'],
      });

      return userCredential;
    } else {
      // Xử lý khi không nhận được mã truy cập từ Facebook
      throw Exception("Failed to get Facebook access token");
    }
  }
}
