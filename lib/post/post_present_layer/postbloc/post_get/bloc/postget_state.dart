part of 'postget_bloc.dart';

abstract class PostgetState extends Equatable {
  const PostgetState();
  
  @override
  List<Object> get props => [];
}

class PostgetInitial extends PostgetState {}

class PostgetLoadingState extends PostgetState {}
class PostgetLoadedState extends PostgetState {
  final List<PostEntity> posts ;

  const PostgetLoadedState({required this.posts});

    @override
  List<Object> get props => [posts];

}
class PostgetFailuerState extends PostgetState {
  final String failuer ;

  const PostgetFailuerState({required this.failuer});
  @override
  List<Object> get props => [failuer];
}