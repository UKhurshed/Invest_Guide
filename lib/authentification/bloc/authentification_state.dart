part of 'authentification_bloc.dart';

@immutable
abstract class AuthenticationState {
  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial();
}

class AuthenticationSuccess extends AuthenticationState{
  final User firebaseUser;

  AuthenticationSuccess(this.firebaseUser);
}

class AuthenticationFailure extends AuthenticationState{
  const AuthenticationFailure();
}