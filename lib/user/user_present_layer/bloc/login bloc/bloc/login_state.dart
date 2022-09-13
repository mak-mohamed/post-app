part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class UserLoginLoadingState extends LoginState {}

class UserLoginsucsessState extends LoginState {
  final UserEntity user;

  const UserLoginsucsessState({required this.user});
  @override
  List<Object> get props => [user];
}

class UserLoginFailState extends LoginState {
  final String failmessage;

  const UserLoginFailState({required this.failmessage});

  @override
  List<Object> get props => [failmessage];
}
