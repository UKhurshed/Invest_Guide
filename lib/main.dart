import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_guide/authentification/bloc/authentification_bloc.dart';
import 'package:invest_guide/authentification/repository/user_repository.dart';
import 'package:invest_guide/screens/home_page.dart';
import 'package:invest_guide/screens/login/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRepository = UserRepository();
  runApp(
      BlocProvider(create: (context) =>
      AuthenticationBloc(
        userRepository: userRepository,
      )
        ..add(AuthenticationStarted()),
        child: MyApp(userRepository: userRepository,),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final UserRepository _userRepository;

  MyApp({UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invest Guide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: _userRepository,);
          }
          if (state is AuthenticationSuccess) {
            return HomePage();
          }
          return Scaffold(appBar: AppBar(),
            body: Container(
              child: Center(
                child: Text('Loading'),
              ),
            ),
          );
        },
      ),
    );
  }
}

