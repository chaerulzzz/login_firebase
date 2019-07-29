import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_firebase/repository/user_repository.dart';
import 'package:login_firebase/ui/login/login.dart';
import 'package:login_firebase/ui/register/register_screen.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback _onPressed;

  LoginButton({
    Key key, 
    VoidCallback onPressed
  }) : _onPressed = onPressed, super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      onPressed: _onPressed,
      child: Text('Login'),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      icon: Icon(FontAwesomeIcons.google, color: Colors.white,),
      onPressed: () {
        BlocProvider.of<LoginBloc>(context).dispatch(LoginWithGooglePressed());
      },
      label: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository}) : assert(userRepository != null), _userRepository = userRepository, super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Create an Account'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }) 
        );
      },
    );
  }
}