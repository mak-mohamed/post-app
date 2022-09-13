import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbook2/core/Failuer&Exception/post%20failuer/Failuer.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/post/post_domain_layer/posr_domain_entity/post_entity.dart';
import 'package:mbook2/post/post_domain_layer/post_usecasess/post_usecasess.dart';

part 'postget_event.dart';
part 'postget_state.dart';

class PostgetBloc extends Bloc<PostgetEvent, PostgetState> {
  final GetAllPOstUseCasess getAllPOstUseCasess ;
  PostgetBloc({required this.getAllPOstUseCasess}) : super(PostgetInitial()) {
    on<PostgetEvent>((event, emit) async {
     
     if (event is PostGetPostsEvent) {
       emit(PostgetLoadingState());
       final postsORFailuer =await  getAllPOstUseCasess.getAllPosts() ; 
       postsORFailuer.fold((failuer) => emit(PostgetFailuerState(failuer: switchFailuer(failuer)))
       , (posts) {
        
        return  emit(PostgetLoadedState(posts: posts));
       } ) ;
     }


    });
  }
  String switchFailuer (PostFailuer failuer){
    switch (failuer.runtimeType) {
      case ServerFailuer : return MyStrings.serverfailure;
       case OffLineFailuer : return MyStrings.offlineserver;
        case EmptyCashFailuer : return MyStrings.emptycash;
        
      

    }
    return MyStrings.unexceptedfailuer;
  }
}
