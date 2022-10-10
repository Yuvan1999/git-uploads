import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'auth_util.dart';

class YuvanProjectFirebaseUser {
  YuvanProjectFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

YuvanProjectFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<YuvanProjectFirebaseUser> yuvanProjectFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<YuvanProjectFirebaseUser>(
      (user) {
        currentUser = YuvanProjectFirebaseUser(user);
        updateUserJwtTimer(user);
        return currentUser!;
      },
    );
