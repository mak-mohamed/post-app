part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}


class UserLoginEvent extends LoginEvent {
  final String usernameoremail ;
  final String password ;

  const UserLoginEvent({required  this.usernameoremail,required  this.password }); 
  
    @override
  List<Object> get props => [usernameoremail,password];
}


class UserLogInEndTimeWaiting extends LoginEvent {}