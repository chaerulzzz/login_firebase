import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_firebase/authentication/authentication.dart';
import 'package:login_firebase/commons/bloc_delegate.dart';
import 'package:login_firebase/repository/user_repository.dart';
import 'package:login_firebase/ui/login/login_screen.dart';
import 'package:login_firebase/ui/splash_screen.dart';
import 'package:login_firebase/ui/home_screen.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(
    BlocProvider(
      builder: (context) => AuthenticationBloc(userRepository: userRepository)
        ..dispatch(AppStarted()),
      child: App(userRepository: userRepository),
    ),
  );
}
class App extends StatelessWidget {
  final UserRepository repository;

  App({Key key, @required UserRepository userRepository}) : assert(userRepository != null),
      repository = userRepository, 
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is UnInitialized) {
            return SplashScreen();
          }

          if (state is UnAuthenticated) {
            return LoginScreen(userRepository: repository);
          }

          if (state is Authenticated) {
            return HomeScreen(name: state.displayName,);
          }

          return null;
        }
      ),
    ); 
  }
}