import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_domain_layer/post_usecasess/post_usecasess.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'post_add_edeit_event.dart';
part 'post_add_edeit_state.dart';

class PostAddEdeitBloc extends Bloc<PostAddEdeitEvent, PostAddEdeitState> {
  final AddPOstUseCasess addPOstUseCasess;
  final DeletePostUseCasess deletePostUseCasess;
  final UpdatePOstUseCasess updatePOstUseCasess;
  PostAddEdeitBloc(
      {required this.addPOstUseCasess,
      required this.deletePostUseCasess,
      required this.updatePOstUseCasess})
      : super(PostDeatilsInitialState()) {
    on<PostAddEdeitEvent>((event, emit) async {
      if (event is PostAddEvent) {
        final failuerorunitadd =
            await addPOstUseCasess.addPost(postEntity: event.postEntity);
        failuerorunitadd.fold(
            (failuer) {  print('on fail') ;  emit(POstFailuerState(failuer: failuer));},
            (unit) {    print('on sucsess') ;  emit(PostSucsessState());});
      } else if (event is PostEdeitEvent) {
        final failuerorunitediet =
            await updatePOstUseCasess.updatePost(postEntity: event.postEntity);
        failuerorunitediet.fold(
            (failuer) => emit(POstFailuerState(failuer: failuer)),
            (unit) => emit(PostSucsessState()));
      } else if (event is POstDeleteEvent) {
        final failuerorunit =
            await deletePostUseCasess.call(postId: event.postId);
        failuerorunit.fold(
            (failuer) => emit(POstFailuerState(failuer: failuer)),
            (unit) => emit(PostSucsessState()));
      } else if (event is PostDetailsIntialEvent) {
        emit(PostDeatilsInitialState());
      } else if (event is PostAddEdietInitialEvent) {
        emit(PostAddEdeitInitialState());
      }
    });
  }
}
