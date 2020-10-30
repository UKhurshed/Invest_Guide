import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:pedantic/pedantic.dart';

part 'authentification_event.dart';

part 'authentification_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc({@required AuthRepository authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(const AuthenticationState.unknown()){
    _userSubcription = _authRepository.user.listen(
          (user) => add(AuthenticationUserChanged(user)),
    );
  }

  final AuthRepository _authRepository;
  StreamSubscription<User> _userSubcription;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AuthenticationUserChanged) {
      yield _mapAuthenticationUserChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      unawaited(_authRepository.logOut());
    }
  }

  @override
  Future<void> close() {
    _userSubcription?.cancel();
    return super.close();
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event,
      ) {
    return event.user != User.empty
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }

}
