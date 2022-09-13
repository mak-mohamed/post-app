part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}
class SplashUser extends SplashState {
  final String username ;

  SplashUser({required this.username}); 
}
class SplashNouser extends SplashState {}
