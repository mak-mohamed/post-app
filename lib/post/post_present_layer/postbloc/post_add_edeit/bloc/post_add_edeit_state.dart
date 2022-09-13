part of 'post_add_edeit_bloc.dart';

abstract class PostAddEdeitState extends Equatable {
  const PostAddEdeitState();
  
  @override
  List<Object> get props => [];
}

class PostDeatilsInitialState extends PostAddEdeitState {}
class PostSucsessState extends PostAddEdeitState{}
class POstFailuerState extends PostAddEdeitState{
  final PostFailuer failuer ;

  const POstFailuerState({required this.failuer});
}

class PostAddEdeitInitialState extends PostAddEdeitState{}
