import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class LoginAppFirebaseUser {
  LoginAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

LoginAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<LoginAppFirebaseUser> loginAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<LoginAppFirebaseUser>(
            (user) => currentUser = LoginAppFirebaseUser(user));
