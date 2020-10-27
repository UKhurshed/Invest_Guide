import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invest_guide/authentification/bloc/authentification_bloc.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({Key key, this.user}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invest Guide'),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLoggedOut());
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('Hello, ${user.email}'),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
