part of 'post_add_edeit_bloc.dart';

abstract class PostAddEdeitEvent extends Equatable {
  const PostAddEdeitEvent();

  @override
  List<Object> get props => [];
}

class PostAddEvent extends PostAddEdeitEvent {
  final PostEntity postEntity;

  const PostAddEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class PostEdeitEvent extends PostAddEdeitEvent {
  final PostEntity postEntity;

  const PostEdeitEvent({required this.postEntity});

  @override
  List<Object> get props => [postEntity];
}

class POstDeleteEvent extends PostAddEdeitEvent {
  final int postId;

  const POstDeleteEvent({required this.postId});
  @override
  List<Object> get props => [postId];
}


class PostDetailsIntialEvent extends PostAddEdeitEvent{}
class PostAddEdietInitialEvent extends PostAddEdeitEvent {
 
}