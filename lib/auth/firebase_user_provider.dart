import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FireonflutterFirebaseUser {
  FireonflutterFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FireonflutterFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FireonflutterFirebaseUser> fireonflutterFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FireonflutterFirebaseUser>(
            (user) => currentUser = FireonflutterFirebaseUser(user));
