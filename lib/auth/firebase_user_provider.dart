import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AdBuilder2FirebaseUser {
  AdBuilder2FirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

AdBuilder2FirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<AdBuilder2FirebaseUser> adBuilder2FirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<AdBuilder2FirebaseUser>(
            (user) => currentUser = AdBuilder2FirebaseUser(user));
