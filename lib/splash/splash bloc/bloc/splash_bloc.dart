import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbook2/user/user_domain_layer/user_usecases/user_usecasess.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashUsecases splashUsecases ; 
  SplashBloc({required this.splashUsecases}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
    if (event is SplashInitEvent) {
      print('we are in splash event');
     final userorfailuer = await  splashUsecases.Call() ;

     userorfailuer.fold((fail) { emit(SplashNouser());},
      (user) {emit(SplashUser(username: user));}) ;
      
    }
    });
  }
}
