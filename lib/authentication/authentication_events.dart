import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvents extends Equatable {
  AuthenticationEvents([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvents {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvents {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvents {
  @override
  String toString() => 'LoggedOut';
}