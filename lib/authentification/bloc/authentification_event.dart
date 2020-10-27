part of 'authentification_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticationStarted extends AuthenticationEvent{
  const AuthenticationStarted();
}

class AuthenticationLoggedIn extends AuthenticationEvent{
  const AuthenticationLoggedIn();
}

class AuthenticationLoggedOut extends AuthenticationEvent{
  const AuthenticationLoggedOut();
}

