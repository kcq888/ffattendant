import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  StreamSubscription? userAuthSubscription;

  AuthController() {
    userAuthSubscription = auth.authStateChanges().listen((newUser) {
      if (kDebugMode) {
        print('AuthController state change: $newUser');
      }
      user = newUser!;
      notifyListeners();
    }, onError: (e) {
      if (kDebugMode) {
        print('AuthController state change error: $e');
      }
    }, onDone: () {
      if (kDebugMode) {
        print('AuthController - state Change: Done');
      }
    });
  }

  @override
  void dispose() {
    userAuthSubscription?.cancel();
    super.dispose();
  }

  bool isAuthenticated() {
    if (user == null) {
      return false;
    } else {
      return user != null;
    }
  }

  void register(String email, String password) {
    if (!validateCredentials(email, password)) return;
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      if (kDebugMode) {
        print('AuthController - registration error: $e');
      }
      // Get.snackbar("User Registration", "User message",
      //     backgroundColor: Colors.redAccent,
      //     snackPosition: SnackPosition.BOTTOM,
      //     titleText: const Text(
      //       "User Registration failed",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //     messageText:
      //         Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void login(String email, String password) async {
    if (!validateCredentials(email, password)) return;
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('AuthController - sign-in error: $e');
      }
      // Get.snackbar("User Login", "Login message",
      //     backgroundColor: Colors.redAccent,
      //     snackPosition: SnackPosition.BOTTOM,
      //     titleText: const Text(
      //       "User Login failed",
      //       style: TextStyle(color: Colors.white),
      //     ),
      //     messageText:
      //         Text(e.toString(), style: const TextStyle(color: Colors.white)));
    }
  }

  void logout() {
    auth.signOut();
  }

  bool validateCredentials(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }
}
