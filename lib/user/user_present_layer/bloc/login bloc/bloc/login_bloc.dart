import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mbook2/core/Failuer&Exception/user%20failuer%20&exception/userfailuer.dart';
import 'package:mbook2/core/constant/mystring.dart';
import 'package:mbook2/user/user_domain_layer/user_Entity/UserEntity.dart';
import 'package:mbook2/user/user_domain_layer/user_usecases/user_usecasess.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginUsecases userloginusecasess;
  LoginBloc({required this.userloginusecasess}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is UserLoginEvent) {
        emit(UserLoginLoadingState());

        final userentityrorfailuer = await userloginusecasess.Call(
            username: event.usernameoremail, password: event.password);

          
        userentityrorfailuer.fold(
            (failuer) {     return emit(UserLoginFailState(failmessage:failuerSwitchcasess(failuer)));} ,
            (userentity) => emit(UserLoginsucsessState(user: userentity)));
      } else  if (event is UserLogInEndTimeWaiting){
        emit(LoginInitial());
      }
    });
  }
}

 String failuerSwitchcasess (UserFailuer failuer) {
    
    print(failuer );

    switch (failuer.runtimeType) {
      case UserServerFailuer: return MyStrings.serverfailure;
       case UserOfflineFailuer: return MyStrings.offlineserver;
        case UseWorngdataFailuer: return MyStrings.worngdatalogin;
        
     
      
    }
 return MyStrings.unexceptedfailuer;
}
